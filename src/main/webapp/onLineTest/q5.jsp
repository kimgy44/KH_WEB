<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String test5 = request.getParameter("htest5");
	out.print("5번문제 답안지 : "+test5);
	// 쿠키 생성하기 ﻿→ insert here
	Cookie ctest5 = new Cookie("test5", test5);
	ctest5.setPath("/onLineTest");
	ctest5.setMaxAge(30*60); //
	response.addCookie(ctest5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 문제5</title>
<script type ="text/javascript">
	function test(pcb){
		console.log(pcb); // pcb는 checkbox에 대한 index값이다. 그래서 0 부터 
		for(let i=0; i<document.f_test1.pcb.length; i++){
			if(pcb ==1)
				document.f_test1.cb[i].cheched = 1;
			 else 
			document.f_test1.cb[i].cheched = 0;
		}
	}
	/* 이전페이지로 넘어가게 */
	function prev(){
		location.href = "q4.jsp";
	}
	
	function next() {
		let temp = 1;
		for(let i=0; i<document.f_test1.cb.length; i++){
			if(document.f_test1.cb[i].checked==1){
				document.f_tes1.htest5.value = temp;
			}
			else{
				temp = temp + 1;
			}
		}//////////end of 
		document.f_test1.submit();
}
</script>
</head>
<body>
<form name="f_test1" method="get" action="score.jsp">
<input type="hidden" name="htest5">
문제5. 다음 중 프로시저에 대한 설명으로 틀린 것을 고르시오.<br>
<input type="checkbox" name="cb" onChange="test(0)">
프로시저를 생성할 때 파라미터를 선언할 수 있다.<br>
<input type="checkbox" name="cb" onChange="test(1)">
파라미터에 여러 변수를 선언할 수 있다.<br>
<input type="checkbox" name="cb" onChange="test(2)">
프로시저안에서 SELECT,INSERT,UPDATE, DELETE 모두 사용 할 수 있다.<br>
<input type="checkbox" name="cb" onChange="test(3)">
프로시저 안에서 commit할 수 없다.
<br>
<br>
<input type="button" value="이전문제" onClick="prev()">
<input type="button" value="다음문제" onClick="next()">
</form>
</body>
</html>