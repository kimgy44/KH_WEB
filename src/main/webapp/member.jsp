<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.vo.Member" %>
<%
	// 스크립틀릿에 작성된 코드는 화면이 아니다. - 출력내용은 없다.
	Member loginUser = new Member();
	loginUser.setName("이순신");
	session.setAttribute("loginUser",loginUser);
%>
