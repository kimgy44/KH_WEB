package book.ch1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class DeptServlet extends HttpServlet {
	Logger logger = Logger.getLogger(DeptServlet.class);

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 페이지 이동이 일어나면 해당 부분이 경유되었다는 확인을 할 수가 없다.
		// 눈에 보이지 않는 코드가 된다.
		// 그래서 불편하다.
		logger.info("doGet 호출 성공"); //경유했다는흔적을남기기위해서 이걸 남겨줌
		String s_name = "이순신";
		//req.setAttribute("s_name", s_name);
		List<DeptVO> list = new ArrayList<>();
		DeptVO dvo = new DeptVO();
		dvo.setDeptno(10);
		dvo.setDname("개발부");
		dvo.setLoc("서울"); 
		list.add(dvo);
		req.setAttribute("list", list);
		//res.sendRedirect("./deptList.jsp");
		// sendRedirect로 페이지를 이동하면 URL이 바뀐다.
		// 이것은 기존의 요청이 끊어지고 새로운 요청으로 다시 페이지를 출력한다.
		// 결론적으로 서버는 요청이 유지되지 않았다. 라고 판정함
		// 반대로 forward로 페이지를 이동 요청하면
		// 주소 URL은 그대로 있는데, 응답페이지는 dept/deptList.jsp가 출력되는
		// 것을 보면 서버 입장에서 사용자의 요청이 아직 계속 유지되고 있는 것으로 판단함
        RequestDispatcher view = req.getRequestDispatcher("./deptList.jsp");
        view.forward(req, res); // 이순신 출력
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost 호출 성공");
	}
}
