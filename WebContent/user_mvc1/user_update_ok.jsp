<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 폼데이터를 받습니다.
	2. DAO에 update() 메서드를 생성하고 업데이트 구문을 실행
	3. 수정 성공시 "회원정보가 수정되었습니다" 출력후에 마이페이지 이동
	   수정 실패시 "회원정보가 실패했습니다" 출력후에 마이페이지 이동
	
	*/
	
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address =request.getParameter("address");
	
	//DAO생성
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = new UserVO(id, pw, name ,email, address, null);
	
	int result = dao.update(vo);;

	if(result == 1) { //업데이트 성공
		session.setAttribute("user_name", name); //이름을 다시 세션에 저장
%>
	<script>
		alert("회원 정보가 수정되었습니다");
		location.href = "user_mypage.jsp";
	</script>

<%		
	} else {
%>
	<script>
		alert("회원 정보 수정에 실패했습니다");
		location.href = "user_mypage.jsp";
	</script>

<%		
	}
%>




