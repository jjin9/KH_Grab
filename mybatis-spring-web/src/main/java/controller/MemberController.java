package controller;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.*;
import repository.MemberSessionRepository;

@Controller
public class MemberController {
   @Autowired
   MemberSessionRepository memberSessionRepository;

   @RequestMapping(value = "/registing", method = RequestMethod.POST)
   public String insrtStep1(HttpServletRequest httpServletRequest, Model model) {
      String mName = httpServletRequest.getParameter("mName");
      String mPw = httpServletRequest.getParameter("mPw");
      String mEmail = httpServletRequest.getParameter("mEmail1");
      String mTel = httpServletRequest.getParameter("cell1") +"-"+httpServletRequest.getParameter("cell2")+"-"+httpServletRequest.getParameter("cell3");
      Date mBirth = java.sql.Date.valueOf(httpServletRequest.getParameter("mBirth"));
      String mGen = httpServletRequest.getParameter("mGen");
      String mPost = httpServletRequest.getParameter("mPost");
      String mAddr = httpServletRequest.getParameter("mAddr");
      String mAddr_d = httpServletRequest.getParameter("mAddr_d");
      Long mAttendcount = 0L;
      String mAuthority = httpServletRequest.getParameter("mAuthority");
      Long mLicense = 0L;
      String mProfile = "";
      String bank = "";
      String account = "";

   Member member = new Member(mEmail,mPw, mName, mTel, mBirth, mGen, mPost, mAddr, mAddr_d, mAttendcount, mAuthority,
            mLicense, mProfile, bank, account);

      Integer result = memberSessionRepository.insertMember(member);
      model.addAttribute("member", member);
      return "main";
      
   }
   
   @RequestMapping(value = "/registingEnter", method = RequestMethod.POST)
   public String insrtStep2(HttpServletRequest httpServletRequest, Model model) {
      String mName = httpServletRequest.getParameter("mName");
      String mEmail = httpServletRequest.getParameter("mEmail1");
      String mPw = httpServletRequest.getParameter("mPw");
      String mTel = httpServletRequest.getParameter("cell1") +"-"+httpServletRequest.getParameter("cell2")+"-"+httpServletRequest.getParameter("cell3");
      Long mLicense = 0L;
      String mPost = httpServletRequest.getParameter("mPost");
      String mAddr = httpServletRequest.getParameter("mAddr");
      String mAddr_d = httpServletRequest.getParameter("mAddr_d");
      Date mBirth = java.sql.Date.valueOf(httpServletRequest.getParameter("mBirth"));
      String mGen = httpServletRequest.getParameter("mGen");
      Long mAttendcount = 0L;
      String mAuthority = httpServletRequest.getParameter("mAuthority");
      String mProfile = "";
      String bank = "";
      String account = "";

      Member member = new Member(mEmail,mPw, mName, mTel, mBirth, mGen, mPost, mAddr, mAddr_d, mAttendcount, mAuthority,
            mLicense, mProfile, bank, account);

      Integer result = memberSessionRepository.insertMemberEnter(member);
      model.addAttribute("member", member);
      return "main";
      
   }
   
   @RequestMapping("/Memberupdate")
   public ModelAndView info(Member member,MultipartFile upload) {
      
      String savePath="/img/"+upload.getOriginalFilename();   
      File file=new File(savePath);
      Integer result = memberSessionRepository.updateMemberUpdate(member);
      String msg=result>0?"수정완료":"수정실패";
      ModelAndView mav=new ModelAndView();
      mav.addObject("msg",msg);
      mav.addObject("result",result);
      mav.setViewName("infoMsg");
      return mav;
   }

   @RequestMapping(value="/MemberDelete", method = RequestMethod.POST)
	public String deleteMember(Member member ,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member deletemember = (Member) session.getAttribute("loginInfo");
		System.out.println("deletemember.getmPw() : " + deletemember.getmPw());
		System.out.println("request.getParameter(\"mPw\") : " + request.getParameter("mPw"));
		if (deletemember.getmPw().equals(request.getParameter("mPw"))) {
			Integer result=memberSessionRepository.deleteMember(deletemember);
			session.invalidate();
			model.addAttribute("result",result);
			System.out.println(result);
		}
		
		return "redirect:/Main";
	}
   /*
    * @RequestMapping(value="/login.do", method = RequestMethod.GET) public String
    * dropStep3(Model model, Member member) {
    * System.out.println(member.getmEmail()); model.addAttribute("member",new
    * Member()); return "main"; }
    */
   
   
   @RequestMapping(value="/Main_login_find", method = RequestMethod.GET)
   public String handleStep8(Model model) {
      model.addAttribute("comment",new Comment());
      return "findPw";
   }
   
   
   @RequestMapping(value="/Main_info", method = RequestMethod.GET)
   public String handleStep9(Model model) {
      model.addAttribute("comment",new Comment());
      return "info";
   }
   
   @RequestMapping(value="/Main_mypage_drop", method = RequestMethod.GET)
   public String handleStep11(Model model) {
	   model.addAttribute("comment",new Comment());
      return "memberDrop";
   }
   
   @RequestMapping(value="/Main_info_enter", method = RequestMethod.GET)
   public String handleStep9_1(Model model) {
      model.addAttribute("comment",new Comment());
      return "infoEnter";
   }
   
   @RequestMapping(value="/Main_mypage_changePw", method = RequestMethod.GET)
   public String handleStep10(Model model) {
      model.addAttribute("comment",new Comment());
      return "changePw";
   }
   
   
   
}