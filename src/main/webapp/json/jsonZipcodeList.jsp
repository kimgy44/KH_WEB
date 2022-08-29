<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.util.DBConnectionMgr, java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement, java.sql.ResultSet"%>
<%@ page import="com.google.gson.Gson"%>

<%
		// 스크립틀릿 
		String dong = request.getParameter("dong");
		if(request.getParameter("dong") == null){
			dong = "역삼";
		}else {
			dong = request.getParameter("dong");
		}
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr dbMgr = new DBConnectionMgr();
	List<Map<String,Object>>  zipList = null;
	StringBuilder sql = new StringBuilder();
	 	 sql.append(" SELECT 					       ");
		 sql.append("        address, zipcode      ");
		 sql.append(" FROM zipcode_t               ");
		 sql.append(" WHERE dong LIKE '%'||?||'%'  ");
		 try{
			con = dbMgr.getConnection();
			// 파라미터로 받은 select문을 전달
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dong);
		 	rs = pstmt.executeQuery();
		 	zipList = new ArrayList<>();
			Map<String, Object> rmap = null;
			while(rs.next()){
				 rmap = new HashMap<>();
				 rmap.put("address", rs.getString("address"));
				 rmap.put("zipcode", rs.getString("zipcode"));
				 //rmap.put("zipcode", rs.getString(2)); //이렇게하면 혼나요
				 zipList.add(rmap);
			 }
			Gson g = new Gson();
			String imsi = g.toJson(zipList);
			out.print(imsi);
		} catch (Exception e) {
			out.println("오라클 서버와 연결 통로 확보 실패");
			// stack메모리에 쌓인 에러 메시지에 대한 history정보 출력 해줌
			e.printStackTrace();
		}	
		
%>
			
			
		 
		 
		 