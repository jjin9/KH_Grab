package model;

import java.util.Date;

public class Member {
   private String mEmail;
   private String mPw;
   private String mName;
   private String mTel;
   private Date mBirth;
   private String mGen;
   private String mAddr;
   private String mAddr_d;
   private String mPost;
   private Long mAttendcount;
   private String mProfile;
   private Long mLicense;
   private String mAuthority;
   private String bank;
   private String account;
   
public String getmAddr_d() {
	return mAddr_d;
}
public void setmAddr_d(String mAddr_d) {
	this.mAddr_d = mAddr_d;
}
public String getmPost() {
	return mPost;
}
public void setmPost(String mPost) {
	this.mPost = mPost;
}
public Member(String mEmail,String mPw,String mName,String mTel,
		Date mBirth,String mGen,String mPost, String mAddr,String mAddr_d, Long mAttendcount, String mAuthority, Long mLicense
		,String mProfile,String bank,String account) {
	   this.mEmail = mEmail; 
	   this.mPw = mPw;
	   this.mName = mName;
	   this.mTel = mTel;
	   this.mBirth = mBirth;
	   this.mGen = mGen;
	   this.mPost = mPost;
	   this.mAddr = mAddr;
	   this.mAddr_d = mAddr_d;
	   this.mAttendcount = mAttendcount;
	   this.mProfile = mProfile;
	   this.mLicense = mLicense;
	   this.mAuthority = mAuthority;
	   this.bank = bank;
	   this.account = account;
}
public Member() {

}
   
public String getmEmail() {
	return mEmail;
}

public void setmEmail(String mEmail) {
	this.mEmail = mEmail;
}

public String getmPw() {
	return mPw;
}

public void setmPw(String mPw) {
	this.mPw = mPw;
}

public String getmName() {
	return mName;
}

public void setmName(String mName) {
	this.mName = mName;
}

public String getmTel() {
	return mTel;
}

public void setmTel(String mTel) {
	this.mTel = mTel;
}

public Date getmBirth() {
	return mBirth;
}

public void setmBirth(Date mBirth) {
	this.mBirth = mBirth;
}

public String getmGen() {
	return mGen;
}

public void setmGen(String mGen) {
	this.mGen = mGen;
}

public String getmAddr() {
	return mAddr;
}

public void setmAddr(String mAddr) {
	this.mAddr = mAddr;
}

public Long getmAttendcount() {
	return mAttendcount;
}

public void setmAttendcount(Long mAttendcount) {
	this.mAttendcount = mAttendcount;
}

public String getmProfile() {
	return mProfile;
}

public void setmProfile(String mProfile) {
	this.mProfile = mProfile;
}

public Long getmLicense() {
	return mLicense;
}

public void setmLicense(Long mLicense) {
	this.mLicense = mLicense;
}

public String getmAuthority() {
	return mAuthority;
}

public void setmAuthority(String mAuthority) {
	this.mAuthority = mAuthority;
}


public String getBank() {
	return bank;
}

public void setBank(String bank) {
	this.bank = bank;
}

public String getAccount() {
	return account;
}

public void setAccount(String account) {
	this.account = account;
}

}