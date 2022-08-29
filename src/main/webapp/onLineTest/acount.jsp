<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 이코드가 먼저 결정이 된다.
	String isPass = request.getParameter("isPass");
	boolean bpass = Boolean.parseBoolean(isPass);
	if(bpass){
%>
당신은 합격입니다.		
<%
	}else{
%>
<%
	}
%>
</body>
</html>