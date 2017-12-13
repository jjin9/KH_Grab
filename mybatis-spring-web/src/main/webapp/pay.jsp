<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />


<title>주문서 작성 | Grab STORE</title>


<link rel="stylesheet" type="text/css" href="//static.musinsa.com/skin/musinsa/css/magazine_common.css?20161230" />
<link rel="stylesheet" type="text/css" href="./css/pay.css" />
<link rel="stylesheet" type="text/css" href="./css/paySub.css" />
<!--<link rel="stylesheet" type="text/css" href="//static.musinsa.com/skin/musinsa/css/font.css?20170221" />-->

<!-- 스토어, 매거진 공통 스크립트 -->
<script type="text/javascript" src="//static.musinsa.com/mfile_outsrc/js/vendor/jquery-1.11.1.min.js?20160201"></script>
<!--// 스토어, 매거진 공통 스크립트 -->

<!-- 다음 주소 가져오기 api-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

function CheckAgree() {
	var is_chk = $("input[name=all_agree]").is(":checked");	
	
	if(is_chk) {
		$("input[name=agree_third]").prop("checked", true);
		$("input[name=agree_return]").prop("checked", true);
		$("input[name=pay_agree]").prop("checked", true);
	} else {
		$("input[name=agree_third]").prop("checked", false);
		$("input[name=agree_return]").prop("checked", false);
		$("input[name=pay_agree]").prop("checked", false);
	}
}



function ToggleThirdAgree() {
	if ($("#thirdBtn").hasClass("detail_close")) {
		$("#thirdAgreeDetail").show();
		$("#thirdBtn").text("닫기");
		$("#thirdBtn").removeClass("detail_close");
	} else {
		$("#thirdAgreeDetail").hide();
		$("#thirdBtn").text("자세히");
		$("#thirdBtn").addClass("detail_close");
	}
}

function sample4_execDaumPostcode() {
	 new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 도로명 조합형 주소 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
             // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
             if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample4_roadAddress').value = fullRoadAddr;

             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
             if(data.autoRoadAddress) {
                 //예상되는 도로명 주소에 조합형 주소를 추가한다.
                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                 document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

             } else if(data.autoJibunAddress) {
                 var expJibunAddr = data.autoJibunAddress;
                 document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

             } else {
                 document.getElementById('guide').innerHTML = '';
             }
         }
     }).open();
   }
</script>
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/responsive.css">
	<script	src="https://www.lifeplus.co.kr/_resource/js/vendor/jquery-1.9.1.min.js"></script>
	<script src="https://www.lifeplus.co.kr/_resource/_web/js/common.js"></script>
	<script type="text/javascript" src="./js/jquery.js"></script>
	<script type="text/javascript" src="./js/main.js"></script>
 <jsp:include page="navi-header.jsp"/>
	
<!-- 오른쪽 콘텐츠 영역 -->
<div class="right_area page_order_form"> 
	<!-- 컨텐츠 영역 -->
	<!--page nation -->
	<div class="pagenation">
		<div class="nav_sub">
			<a href="/">STORE</a><span class="icon_entity">&gt;</span><span>주문서</span>
		</div>
	</div>
	<!--//page nation -->

	<form name="f1" id="f1" method="post" >
		<!--article-title-->
		<div class="article-title">
			<h2 class="title-page">
				ORDER / PAYMENT<span>주문/결제</span>
			</h2>
			<div class="page-sorting">
				<span class="current-page">주문서</span> <span>&gt;</span> <span>주문완료</span>
			</div>
		</div>
		<!--//article-title-->
		<div class="section order_product_info">
			<h3 class="section_title">
				PRODUCT INFO<span>상품 정보</span>
			</h3>
			<!--cart products-->
			<table class="table_basic order_cart_table">
				<colgroup>
					<col>
						<col width="50px">
						<col width="100px">
						<col width="80px">
						<col width="69px" class="charge ">
						<col width="100px" class="charge ">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품 정보</th>
						<th scope="col">수량</th>
						<th scope="col">상품 금액</th>
						<th scope="col">배송비</th>
						<th scope="col">주문금액</th>
					</tr>
				</thead>
				<tbody>
					<!-- 반품여부 N : 반품불가 상품 -->
					<tr>
						<td class="td_product">
							<input type="hidden" name="no"	value="49187680" /> <input type="hidden"
								name="coupon_amt_49187680" value="0" />
							<input type="hidden" name="cart_info" value="601276|0|BLACK 2 / 95|299000|0|0|0|N|Y|49187680" />
							<div class="connect_img">
									<img src="./img/property_1.jpg" />
							</div>
							<div class="article_info connect_info">
								<div class="box_product">
									<strong> 
									<span	style="color: #f00;"> </span> [Canon]
										</strong> <span class="list_info"> Canon 포토 용지 </span>
									</div>
									<div class="order_option_box">
										<p>
											옵션 : 50매
										</p>
									</div>
							</div>
						</td>
						<td><strong>1 개</strong></td>
						<td class="price"><strong>299,000 원</strong></td>
						<td rowspan="1"><strong>무료</strong>
						<td><strong>299,000 원</strong></td>
					</tr>
				</tbody>
			</table>
			<div class="cell_order_form">
				<div>
					<ul class="list_section_type">
						<li>- Grab 스토어는 기본적으로 대한민국 내 제주도 및 도서 산간 지역 포함 
						<span>전	지역, 전 상품 무료배송입니다.</span>
						</li>
						<li>- 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도
							표기되어 있습니다.</li>
						<li>- 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</li>
					</ul>
				</div>
				<!--결제금액-->
				<div class="cell_order_price total_price_wrap">
					<ul class="cell_order_totalPrice">
						<li class="total_title">총 상품 금액</li>
						<li class="total_price" id="total_prd_amt">299,000 원</li>
					</ul>
				</div>
				<!--//결제금액-->
			</div>
		</div>

		<div class="section order_coupon_discount">
			<h3 class="section_title">
				COUPON / DISCOUT<span>쿠폰/추가 할인</span>
			</h3>
			<div class="cell_order_form">
				<!--회원할인-->
				<!--할인상세-->
				<div class="discount_contents">
					<ul>
						<li class="cell_discount_tit">보유 쿠폰 할인</li>
						<li class="cell_discount_detail2"><a class="plain-btn btn"
							onClick="Order.viewCouponPop(); return false;">쿠폰 조회/적용</a> <span
							class="font_basic txt_desc_btn">(쿠폰 허용 상품 / 일부 쿠폰 제외)</span></li>
					</ul>

					<ul>
						<li class="cell_discount_tit">할인 합계</li>
						<li class="cell_discount_detail">모든 할인 내역을 합산한 금액입니다.</li>
					</ul>
				</div>
				<!--//할인상세-->
				<!--할인금액-->
				<div class="cell_order_form2 cell_order_price">
					<ul class="list_discount_order">
						<!-- 배송비 -->
					</ul>
					<ul class="list_discount_order">
						<li class="right_cell_order">보유 쿠폰 할인</li>
						<li class="right_cell_price"><input type="hidden"
							name="kcoupon" readonly value="0" /> - <strong id="coupon_price">0</strong>
							원</li>
					</ul>
					<ul class="list_discount_order">
						<li class="right_cell_sum">할인 합계</li>
						<li class="right_cell_result"><strong id="total_pay_dc_amt">-0</strong>
							원 <span class="payment_off_grey" id="total_dc_rate">0</span> <span
							class="txt_unit_discount">%</span></li>
					</ul>
				</div>
				<!--//할인금액-->
				<!--//회원할인-->
			</div>

			<div class="cell_order_form">

				<div class="cell_order_price total_price_wrap">
					<ul class="box_total_price">
						<li class="total_title">최종 결제 금액</li>
						<li class="total_price"><strong id="pay_amt">299,000</strong>
							원</li>
						<!--
							<li class="right_cell_app">특별 적립(APP구매)</li>
							<li class="right_cell_saving">0 원</li>
							-->
					</ul>
				</div>
			</div>
			<!--//할인-->
		</div>

		<div class="right_contents section_address">
			<div class="cell_order_form article_tit">
				<div class="cell_order_form1">
					<h3 class="title-box">
						RECIPIENT INFO <span class="korSub">수령자 정보</span>
					</h3>
				</div>
			</div>

			<div class="cell_order_form box_address_cell">
				<div class="clear cell_order_form1 border_add_order">
					<!--수령자 정보-->
					<ul class="box_receiver_info">
						<li class="cell_discount_tit">배송지 선택</li>
						<li class="cell_discount_detail"><label
							class="box_choice fist"> <input type="radio"
								id="address_dongil" name="adress_chk"
								onClick="Order.sameOrder(this);" /> 기본 배송지(구매자 정보) <input
								type="radio" id="address_dongil" name="adress_chk"
								onClick="Order.sameOrder(this);" /> 신규 배송지
						</label></li>
					</ul>
					<ul class="box_receiver_info">
						<li class="cell_discount_tit">수령인 / 배송지명</li>
						<li class="cell_discount_detail2 order_address_form box_receiver">
							<!--
								<a class="plain-btn btn cart_amount">최고관리자님 배송지</a>
								<a class="plain-btn btn cart_amount">최고관리자님 배송지</a>
								--> <input type="text" name="rcvr_nm" /> <span
							class="plain-btn btn cart_amount"
							style="cursor: default; display: none" id="baesong_title"></span>
						</li>
					</ul>
					<ul class="box_receiver_info">
						<li class="cell_discount_tit">휴대전화</li>
						<li class="cell_discount_detail order_address_form box_phone">
							<select name="rmobile1">
								<option value="">선택하세요</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> <!--<input type="text" name="rmobile1" />--> - <input type="text"
							name="rmobile2" /> - <input type="text" name="rmobile3" />
						</li>
					</ul>
					<ul class="box_receiver_info">
						<li class="cell_discount_tit">전화번호</li>
						<li class="cell_discount_detail order_address_form box_tel">
							<select name="rphone1">
								<option value="">선택하세요</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> <!--<input type="text"  name="rphone1" />--> - <input type="text"
							name="rphone2" /> - <input type="text" name="rphone3" />
							<p>
								<input type="checkbox" onClick="SetRecipientPhoneNumber(this);"
									id="r_PhoneNumberCheckBox" name="rphonecheckbox" /> 없음
							</p>
						</li>
					</ul>
					<ul class="box_receiver_info">
						<li class="cell_discount_tit">배송지 주소 <!--<input type="checkbox" /> <span class="font_basic">회원 정보 변경</span>-->
						</li>
						<li class="cell_discount_detail2 order_address_form box_address">
							<input type="text" class="zipcode" id="sample4_postcode" placeholder="우편번호" readonly>
							<a	class="plain-btn btn btn-zipcode" onClick="sample4_execDaumPostcode()">우편번호찾기</a>
							<br />
							<input type="text" class="address" id="sample4_roadAddress" placeholder="도로명주소" readonly>
							<input type="text" class="address detail" id="roadAddress_detail" placeholder="나머지 주소">

						</li>
					</ul>
					<ul class="box_receiver_info">
						<li class="cell_discount_tit">배송 메모<br /> <!--<input type="checkbox" /> <span class="font_basic">상품별 입력</span>-->
						</li>
						<li class="cell_discount_detail box_memo">
						<textarea name="dlv_msg">
						</textarea>
							<p>※ 택배기사님께 전할 말씀을 남겨주세요.</p> 
						</li>
					</ul>
					<!--수령자 정보-->
				</div>

			</div>
		</div>

		<div class="right_contents section_payment">
			<h3 class="title-box">
				PAYMENT INFO / AGREEMENT <span class="korSub">결제 정보 / 주문자 동의</span>
			</h3>
			<div>
				<!--신용카드 -->
				<div class="cell_order_form">
					<div class="clear cell_order_form1 border_add_order"
						id="payment_info_area">
						<!--결제 정보-->
						<ul class="list_payment_order">
							<li class="cell_discount_tit">결제 수단</li>
								<li class="cell_discount_detail">
								<label class="box_choice first">
								<input type="radio"	id="paym_01" type="radio" name="kyejae" value="card"
										onclick="CalculateAmt(); pay_info_area_show('card'); pay_info_view('card');" />
										신용 카드
								</label>
								<label class="box_choice"> <input type="radio" id="paym_05" type="radio" name="kyejae" value="virtual"
										onclick="checkMobileCretify(this, 'Y'); CalculateAmt(); pay_info_area_show('virtual'); pay_info_view('virtual');" />
										가상 계좌(무통장)
								</label>
								<!-- 결제수수료율 설정값 출력 부분 //-->
								<input type="hidden" name="card_pay_fee_ratio" value="0" />
								<input type="hidden" name="mobile_pay_fee_ratio" value="5" />
							</li>
						</ul>

						<ul class="list_payment_order">
							<li class="cell_discount_tit last">주문자 동의<br /> <label>
									<input type="checkbox" name="all_agree" onClick="CheckAgree();" />
									<span class="font_basic">전체 동의</span>
							</label>
							</li>
							<li class="cell_discount_detail last">
								<p class="box_check_agree individual">
									<label> <input type="checkbox" name="agree_third" /> <span>개인정보
											제3자 제공 동의(필수)</span>
									</label>
								</p>
								<p class="box_summary_agree">
									배송 등 거래를 위해 판매자에게 개인정보가 공유됩니다. <a href="javascript:void(0)"
										onClick="ToggleThirdAgree(); return false;"><span
										class="detail_close" id="thirdBtn">자세히</span></a>
								</p>

								<p class="box_detail_agree thirdAgreeDetail" id="thirdAgreeDetail">
									무신사의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, 무신사((주)그랩)는 거래 당사자간 원활한 의사소통
									및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 무신사 입점업체 판매자 및 배송업체에 아래와
									같이 공유하고 있습니다.<br /> 1. 무신사((주)그랩)는 귀하께서 무신사 입점업체 판매자로부터 상품 및
									서비스를 구매하고자 할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2(개인정보 공유동의
									등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. "개인정보 제3자
									공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.<br /> 2. 개인정보를 공유받는자
									: (주) 더네이쳐홀딩스 <br /> 3. 공유하는 개인정보 항목 : 구매자 성명, 전화번호, ID, 휴대폰
									번호, 상품 구매정보, 상품 수취인 정보(성명, 주소, 전화번호)<br /> 4. 개인정보를 공유받는 자의 이용
									목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을
									위한 배송지 확인 등<br /> 5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및
									이용 목적 달성 시까지 보관합니다.<br /> 6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지
									않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.
								</p>
								<p class="box_check_agree condition" style='display: none'>
									<label>
										<input type="checkbox" name="agree_return" checked="checked" />
										 <span>주문제작 상품 주문 후 취소 불가 동의(필수)</span>
									</label>
								</p>
								<p class="box_summary_agree" style='display: none'>
									주문제작 상품은 주문 이 후 교환/환불이 불가능 합니다. <a href="javascript:void(0)"
										onClick="ToggleTakeback(); return false;">
										<span class="detail_close" id="returnBtn">자세히</span></a>
								</p>

								<p class="box_detail_agree thirdAgreeDetail" id="returnAgreeDetail">
									■ 주문 상품 중 주문 후 상품의 제작에 들어가는 주문제작 상품의 경우 소비자의 주문에 의하여 개별 생산 되며<br />
									생산이 시작된 이 후 해당 재화를 타인에게 판매가 불가능 함으로 주문 후 취소, 주문 후 교환, 주문 후 환불이
									불가능 합니다. <br /> 주문 시 해당 내용을 참고하여 신중한 구매 부탁 드립니다.<br /> [관련
									조항]<br /> 전자상거래 등에서 소비자보호에 관한 법률 시행령[시행 2015.1.1.] [대통령령
									제25840호, 2014.12.0., 타법개정]<br /> 제 21조(청약철회등의 제한) 법 제 17조
									2항제5호에서 “대통령령으로 정하는 경우＂란 소비자의 주문에 따라 개별적으로 생산되는 재화등 <br /> 또는
									이와 유사한 재화등에 대하여 법 제 13조제2항제5호에 따른 청약 철회등(이하 :쳥약철회등＂이라한다.)을 인정하는
									경우 <br /> 통신판매업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여<br />
									별도로 그 사실을 고지하고 소비자의 서면(전자문서를 포함한다)에 의한 동의를 받은 경우를 말한다.<br />
								</p>
								<p class="box_check_agree condition">
									<label> <input type="checkbox" name="pay_agree" /> <span>위
											상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의 합니다.(필수)</span>
									</label>
								</p>
							</li>
						</ul>
						<!--//결제 정보-->
					</div>

				</div>
				<!--//신용카드 -->
			</div>
			<!--p class="box_bottom_link"><span class="first"><a href="/app/cart">장바구니</a>↗</span> <span><a href="/app">스토어 메인</a>↗</span></p-->
			<!--cart button-->
			<div class="btn_wrap btn_type01">
				<a href="javascript:void(0)" onclick="Order.valid();"
					class="btn_black">PAYMENT <span class="btn_side_text">결제하기</span></a>
			</div>
			<!--//cart button-->
		</div>
		<!--// 컨텐츠 영역 -->
	</form>
	
</div>
<!--// 오른쪽 콘텐츠 영역 -->
</div>
<jsp:include page="navi-footer.jsp"/>
</body>
</html>