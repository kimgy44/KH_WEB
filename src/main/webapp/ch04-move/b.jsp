<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
<%!
// 디클러레이션 
	int age =10; // 전역변수 선언
	public String getName() {  // 메소드 선언 가능함 그러나 쓰지 않는다.
		return "강감찬";
	}
	// MVC 패턴 - 관심사 분리(화면은 너가 해줘. 나는 로직을 구현할께, 입력관심사, 출력관심사,)
	// a.jsp - (jsp.api가 해준다. 컨테이너(=엔진) 이) -> a_jsp.java(서블릿)
	// -> 브라우저 쓰기 document.write("<b>굵은글씨</b>")
%>
<%
	String r_name = (String)request.getAttribute("r_name");
	out.print(r_name);
%>
1. 이페이지는 a.jsp페이지내에 출력됩니다.
<br>
2. 여기는 b.jsp페이지 내용입니다.
</body>
</html>