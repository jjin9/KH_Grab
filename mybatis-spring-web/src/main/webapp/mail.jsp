<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="qna.SMTPAuthenticator" %>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.*,javax.servlet.*,java.util.*" %>
    <%@page import="model.*,org.springframework.context.*" %>
    <%@page import="org.springframework.context.support.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result>=1}">
	<script>
 	window.alert("�ӽ� ��й�ȣ�� �Է��Ͻ� ���Ϸ� �߼۵Ǿ����ϴ�.");
 	location.href="login.jsp";
 	</script>
</c:if>

<c:if test="${result==0}">
	<script>
 	window.alert("�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�.");
 	location.href="findPW.jsp";
 	</script>
</c:if>



</body>
</html>

<%System.out.println("��µǾ�����444");%>
