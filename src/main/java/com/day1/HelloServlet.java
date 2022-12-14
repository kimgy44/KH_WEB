package com.day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Restful API - GET방식, POST방식

public class HelloServlet extends HttpServlet{
	// 그냥 자바가 아닌 서블릿이 되기 위한 전제 조건은 반드시 HttpServlet을 상속
	// 그냥 자바는 요청객체와 응답 객체를 주입 받을 수 없다.
	// 왜 서블릿 이어야 하나?
	// = 자바로 어떻게 웹 서비스를 제공하지?
	// 어노테이션(spring boot 어노테이션 주입, 설정)
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException{
		System.out.println("doGet 호출 성공");
		
		req.setAttribute("name", "scott");
		res.sendRedirect("./helloResponse.jsp");
		//RequestDispatcher view = req.getRequestDispatcher("./helloResponse.jsp");
		//view.forward(req, res);// 주소창이 안바뀐다. -> 요청이 계속 유지되고 있다 - 톰캣이
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException{
		
	}
}

/*
 * 톰캣 서버를 기동한다.
 * 프로젝트에서 web.xml문서(dd파일:deployment descriptor - 배치서술자)를 가장 먼저 로딩한다.
 * nodejs, react로 따진다면 json의 역할
 * xml은 화면을 그리지 않는다.
 * xml은 데이터베이스의 역할을 할 수 는 있지만 비효율적임
 * 요청URL과 서블릿 클래스의 매핑<배치서출자 - web.xml문서>을 맡긴다.
 * 사용자 입장 : 브라우저에서 http://192.168.40.3:/8000/day1/hello.do
 * 위와 같이 주소창에 요청하는 것은 GET방식이다.
 * 나는 doGet 메소드를 호출한 적이 없는데 어떻게 페이지가 출력되었을까? __web.xml(배치서술자)에서의 url-pqttern으로 요청이 일어남
 * 
 * 문제제기
 * print메소드를 통해서 html태그를 작성하는 건 많이 비효율적이다.
 * 
 * 그래서 JSP를 사용한다 - view계층
 * 서블릿은 컨트롤계층을 맡기자. - 실제로 업무를 처리하는 클래스는 아니다.
 * 사용자가 입력한 값을 듣고 백엔드(자바, 오라클)에 전달해주는 역할을 함
 * 어떤 응답 페이지로 출력이 나가야 되는지를 결정해 준다.
 * 
 * 화면을 직접 그리지 않는데 어떻게 출력페이지로 이동을 시킨다는 걸까?
 *  * jsp에서 페이지 이동하는 방법 __ 2가지 * 차이점도 알고 잊자
 *  
 * 1)응답 객체를 통해서 페이지를 이동시킬 수 있다.
 *   -> get방식이고, 주소창이 바뀐다. (현재 요청이 끊어지고, 새로운 요청이 일어남)
 *   http는 비상태 프로토콜이다.
 *  res.sendRedirect("XXX.jsp");   => 주소창이 바뀐다.
 *  기존의 요청이 끊어지고 새로운 요청이 일어났다.
 *  
 * 
 *  2) RequestDispatcher view = req.getRequestDispatcher("XXX.jsp");
 *  view.forward(req, res);  => 주소창이 안바뀐다. 즉 요청이 계속 유지되고 있다. - 톰캣이
 *  (톰캣서버는 forward를 통해서 )
 */ 

