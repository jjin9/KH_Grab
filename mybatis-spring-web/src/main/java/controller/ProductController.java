package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.BuyList;
import model.BuyProduct;
import model.Payment;
import model.Product;
import repository.BuyListSessionRepository;
import repository.BuyProductSessionRepository;
import repository.PaymentSessionRepository;
import repository.ProductSessionRepository;

@Controller
public class ProductController {

	@Autowired
	ProductSessionRepository productSessionRepository;
	
	@Autowired
	BuyProductSessionRepository buyProductSessionRepository;
	
	@Autowired
	PaymentSessionRepository paymentSessionRepository;
	
	@Autowired
	BuyListSessionRepository buyListSessionRepository;
	
	
	//마이바티스와 DB 정보를 받아서  
	//정보들
	
	
	@RequestMapping(value="/Main_shop")
	public String shopStep1(Product product, Model model) {
		List<Product> result = productSessionRepository.selectProductList();
		model.addAttribute("product", result);
		return "shop";
	}
	
	@RequestMapping(value="/shop_content", method = RequestMethod.POST)
	public String shopStep2(HttpServletRequest httpServletRequest, Model model) {
		String p_name = httpServletRequest.getParameter("p_name");
		System.out.println("p_name:"+p_name);
		Product result = productSessionRepository.selectProduct(p_name);
		System.out.println("result:"+result);
		model.addAttribute("product",result);
		return "content";
	}
	
	@RequestMapping(value="/shop_payment", method = RequestMethod.POST)
	public String shopStep3(HttpServletRequest httpServletRequest, Model model) {
		String p_name = httpServletRequest.getParameter("p_name");
		String p_payStock = httpServletRequest.getParameter("p_payStock");
		System.out.println("p_name:"+p_name);
		System.out.println("p_payStock:"+p_payStock);
		Product result = productSessionRepository.selectProduct(p_name);
		System.out.println("result:"+result);
		model.addAttribute("product",result);
		return "pay";
	}
	
	
	@RequestMapping(value="/addProductList", method = RequestMethod.POST)
	public String shopStep4(HttpServletRequest httpServletRequest, Model model) {
		String prodName = httpServletRequest.getParameter("p_name");
		System.out.println("p_name:"+prodName);
		int qty = Integer.parseInt(httpServletRequest.getParameter("p_payStock"));
		System.out.println("qty:"+qty);
		
		int total_price = qty * Integer.parseInt(httpServletRequest.getParameter("p_price"));
		System.out.println("total_price:"+total_price);
		HttpSession session = httpServletRequest.getSession(false);
		Product prod = productSessionRepository.selectProduct(prodName);
		prod.setProdStock(qty);
		prod.setProdPrice(total_price);
		ArrayList list = (ArrayList)session.getAttribute("productList");
		if(list == null) {
			list= new ArrayList();
		}
		list.add(prod);
		session.setAttribute("productList", list);
		System.out.println("장바구니세션:"+(ArrayList)session.getAttribute("productList"));
		return "addProductListComplete";
	}
	
	@RequestMapping(value="/paying", method = RequestMethod.POST)
	public String shopStep5(HttpServletRequest httpServletRequest, Model model) {
		Date today = new Date();
		
		int qty = Integer.parseInt(httpServletRequest.getParameter("qty"));
		String total_price = httpServletRequest.getParameter("p_totalprice");
		String howPay = httpServletRequest.getParameter("kyejae");
		String rv_name = httpServletRequest.getParameter("rcvr_nm");
		String receiAddr = "("+httpServletRequest.getParameter("sample4_postcode") +") "+ httpServletRequest.getParameter("sample4_roadAddress") +" "+ httpServletRequest.getParameter("roadAddress_detail");
		String m_email = httpServletRequest.getParameter("member_email");
		String dlv_msg = httpServletRequest.getParameter("dlv_msg");
		String how_del = "택배";
		String prodName = httpServletRequest.getParameter("prod_name");
		System.out.println("수량:"+qty);
		System.out.println("총액:"+total_price);
		System.out.println("결제방법:"+howPay);
		System.out.println("받는사람:"+rv_name);
		System.out.println("주소:"+receiAddr);
		System.out.println("이메일:"+m_email); //이메일로 회원 전화번호 DB 받기
		System.out.println("메시지:"+dlv_msg);
		System.out.println("물건이름:"+prodName);
		System.out.println("날짜:"+today);


		System.out.println("test:"+buyProductSessionRepository.selectMaxBuyNum()); //null로 뜸
		
		//BuyNum 최대값 출력
		int maxBuyNum = buyProductSessionRepository.selectMaxBuyNum().getBuyNum() + 1;
		System.out.println("maxBuyNum:"+maxBuyNum);

		//PayNum 최대값 출력
		int maxPayNum = paymentSessionRepository.selectMaxPayNum().getBuyNum() + 1;
		System.out.println("maxPayNum:"+maxPayNum);
		
		//구매 DB 넣은 결과
		BuyProduct buyProduct = new BuyProduct(maxBuyNum, today, total_price, how_del, rv_name, receiAddr, m_email);
		System.out.println("구매자:"+buyProduct.getmEmail());
		System.out.println("구매DB주소:"+buyProduct.getReceiAddr());
		int buyResult = buyProductSessionRepository.insertBuyProduct(buyProduct);
		System.out.println("buyResult:"+buyResult);
		
		//결제 DB 넣은 결과
		Payment payment = new Payment(maxPayNum, maxBuyNum, howPay, Integer.parseInt(total_price), dlv_msg);
		int payResult = paymentSessionRepository.insertPayment(payment);
		System.out.println("payResult:"+payResult);
		
		//구매리스트 DB 넣은 결과
		BuyList buyList = new BuyList(maxBuyNum, prodName, qty);
		int listResult = buyListSessionRepository.insertBuyList(buyList);
		System.out.println("listResult:"+listResult);
		model.addAttribute("result", listResult);

		
		return "payComplete";
	}
	
	
}
