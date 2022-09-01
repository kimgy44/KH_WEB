<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 이확장자가 있으면 jsp  -->
<!--
jsp : java server page
처리 주체가 서버(WAS :Web Application Server) 이다.
동적페이지 처리가 가능하다.  - Back-End Developer
html, css, js는 정적페이지 처리 가능 - Front-End Developer
VS-CODE에서 사용하던 live server는 사용이 불가한가요? 네
왜냐하면 이 서버에는 jsp엔진이 없다.
-->
<%
	String name = "scott";
	out.print(name); //scott출력 - 브라우저에
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style type="text/css">
	body {
		text-align : center
		}
		table {
			margin-left:auto;
			margin-right:auto;
			border : thin dotted gray;
			}
			th, td {
				border : thin dotted gray;
			}
			th {/* th만 컬러주기 */
				background-color: #FFAAAA;
			}
</style>
</head>
<body>
<table width="300px" height="80px">
    <tr>
        <td align="center" colspan="2">보드판매집계</td>
    </tr>
    <tr>
        <th width="120px">보드판매량</th>
        <!-- 텍스트노드는 태그이름은 없고 태그값만 있다. -->
        <td width="180px"><span id="boardSold">10</span></td>
    </tr>
    <tr>
        <th width="120px">구매가</th>
        <td width="180px"><span id="cost">700000</span></td>
    </tr>
    <tr>
        <th width="120px">소비자가</th>
        <td width="180px"><span id="price">850000</span></td>
    </tr>
</table>
<h2>마진금액 : <span id="cash">1500000</span></h2>
<button onclick="getBoardSold()">마진금액은?</button>
<script>
	function getBoardSold() {
		$.ajax({
			method:"get",
			url:"./boardSellAction.jsp?"+new Date().getTime(),   //서버쪽에 url보내기
			success:function(result){
			   //console.log("result:"+result);
			   const boardSold = $("#boardSold").text(result);//10-> 15  제이쿼리 썼을때와
			   const costEl = document.getElementById("cost"); //제이쿼리 안썼을떄랑
			   const cost = getText(costEl);
			   alert("구매가 :"+cost);
			   const price = $("#price").text();
			   const cashPerBoard = price - cost;
			   //alert("보드 당 마진금액 : "+cashPerBoard);
			   $("#cash").text(cashPerBoard*result);
			}
		});
	}
	// 2번째 파라미터로 받은 문자열을 첫번째 파라미터로 받은 위치에 붙여준다.
	function replaceText(el,text){
		if(el!=null){
			//기존의 노드에 들어있는 값은 초기화 시킨다.
			clearText(el);
			let newNode = document.createTextNode(text);
			el.appendChild(newNode); /*  보드판매랑 수량 바꿀때, replace text */
		}
	}//replaceText ended​
	function clearText(el){/* 파라미터로 받은 태그에 있는 자손,텍스트가 있으면 지워달라. */
		if(el !=null){
			if(el.childNodes){
			//replaceText(boardsSoldEl, newTotal);
				for(let i=0;i<el.childNodes.length;i++){
					let childNode = el.childNodes[i];
					el.removeChild(childNode); /* el태그의 자식요소 지우기, 보드판매량 10을 지울때 사용  새로운값을 넣을때는 replace text */
				}//for ended
			}//if ended
		}//if ended 노드가 널이 아니면
	}//clearText ended​
	//childNodes는 지정된 개체의 직접적인 자식개체인  HTML elements와
	//TextNode개체들의 컬렉션을 반환한다.
	function getText(el){
		alert("getText호출성공");
		let text = "";
		if(el !=null){
			if(el.childNodes){//자바스크립트에서는 0이 아니면 모두 true
				alert("11 호출 성공 : "+el.childNodes.length);
				for(let i=0;i<el.childNodes.length;i++){
					let childNode = el.childNodes[i];
				alert("11 호출 성공");
					//너 텍스트 노드니?
					if(childNode.nodeValue !=null){
						text = text + childNode.nodeValue;
					}
				}//같은 노드가 n개 있을 때를 위해
			}
		}//자식 노드가 존재하니?
		return text;  //만ㄴ약에 반환값이 없으면 언디파인이반환됨
	}//getText ended​
</script>
</body>
</html>