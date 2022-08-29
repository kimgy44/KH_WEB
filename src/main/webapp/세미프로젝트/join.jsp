<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="txt/css">
	h1{
    	text-align: center;
	}
	table{
		margin-left:auto;
		margin-right:auto;
 	    text-align: center;
		
	}

	th{
 	   width: 200px;
	}
	td{
  	  width: 400px;
	}
</style>
<title>회원가입 창</title>
</head>
<body>
<form method="post" action="${contextPath}/member/addMember.do">
    <h1>회원가입창</h1>
    <table>
        <tr>
            <th>
                <p align="right">아이디</p>
            </th>
            <td><input type="text" name="id"></td>
        </tr>
        
        <tr>
            <th>
                <p align="right">비밀번호</p>
            </th>
            <td><input type="password" name="pwd"></td>
        </tr>
        
        <tr>
            <th>
                <p align="right">이름</p>
            </th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>
                <p align="right">전화번호</p>
            </th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>
                <p align="right">이메일</p>
            </th>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <th>
                <p align="right">&nbsp;</p>
            </th>
            <td>
            <input type="submit" value="가입하기">
            <input type="reset" value="다시입력">
            </td>
        </tr>
    </table>
</form>
</body>
</html>



