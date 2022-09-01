<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.google.gson.*" %>    
<%
	String mem_tel = request.getParameter("mem_tel"); //듣기!
	//out.print("주문자 전화번호자 :" +mem_tel);
	List<Map<String,String>> cusList = new ArrayList<>();
    Map<String,String> rMap = new HashMap<>();
    rMap.put("mem_name","김유신");
    rMap.put("mem_addr","서울시 마포구 공덕동");
    rMap.put("mem_tel","0255556666");
    cusList.add(rMap);
    rMap = new HashMap<>();
    rMap.put("mem_name","김춘추");
    rMap.put("mem_addr","서울시 금천구 가산동");
    rMap.put("mem_tel","0277776666");
    cusList.add(rMap);
    rMap = new HashMap<>();
    rMap.put("mem_name","이성계");
    rMap.put("mem_addr","서울시 영등포구 당산동");
    rMap.put("mem_tel","0277778888");
    cusList.add(rMap);
    String address = "";
    for(int i=0; i<cusList.size(); i++){//serch, find, 필터!
    	Map<String,String> rmap = cusList.get(i);
    	if(rmap.get("mem_tel").equals(mem_tel)){/* equals를 비교할때는 값을비교 vs 주소번지를 가리키는 주소번지를 비교 !! 후자 _참조형  */
    		address = rmap.get("mem_addr");
    	}
    }
    Gson g = new Gson();
    String result = g.toJson(cusList);
    out.print(address);
%>