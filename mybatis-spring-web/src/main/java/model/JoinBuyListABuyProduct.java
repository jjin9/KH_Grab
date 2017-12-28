package model;

import java.util.Date;
import java.util.List;


public class JoinBuyListABuyProduct {
	private Date buyDate;
	private String prodName;
	private int bQuantity;
	private String totalPrice;
	private String prodPic;
	private String cEmail;




	private List<JoinBuyListABuyProduct> JoinBuyListABuyProducts;
	
	public List<JoinBuyListABuyProduct> getJoinBuyListABuyProducts() {
		return JoinBuyListABuyProducts;
	}

	public void setJoinBuyListABuyProducts(List<JoinBuyListABuyProduct> joinBuyListABuyProducts) {
		JoinBuyListABuyProducts = joinBuyListABuyProducts;
	}

	public JoinBuyListABuyProduct(Date buyDate, String prodName, int bQuantity, String totalPrice, String prodPic, String cEmail) {
		this.buyDate = buyDate;
		this.prodName = prodName;
		this.bQuantity = bQuantity;
		this.totalPrice = totalPrice;
		this.prodPic = prodPic;
		this.cEmail = cEmail;
	}

	public JoinBuyListABuyProduct() {

	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getbQuantity() {
		return bQuantity;
	}

	public void setbQuantity(int bQuantity) {
		this.bQuantity = bQuantity;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getProdPic() {
		return prodPic;
	}

	public void setProdPic(String prodPic) {
		this.prodPic = prodPic;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
}