<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String test5 = request.getParameter("htest5");
	out.print("2번문제 답안지 : "+test5);
	// 쿠키 생성하기 ﻿→ insert here
	Cookie ctest5 = new Cookie("test5", test5);
	ctest5.setPath("/onLineTest");
	ctest5.setMaxAge(30*60); //
	response.addCookie(ctest5);
	//5번 답안지 생성 후 판정 페이지로 이동하기
	response.sendRedirect("account.jsp");
%>