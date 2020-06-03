<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. DAO에 login(id, pw)메서드로 로그인 유효성 검사 메서드 선언
		login메서드를 통해 아이디 비밀번호가 있는지 검사.
	2. rs.next() true라면 1을반환, rs.next() false라면 0을 반환
	3. 0이 반환되면 "아이디 비밀번호 확인하세요" 출력후 뒤로가기
	4. 1이 반환되면 user_mypage로 이동
	
	*/

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	
	int result = dao.login(id, pw);
	
	if(result == 0) {
%>		
	<script>
		alert("아이디 비밀번호를 확인하세요");	
		history.go(-1);
	</script>
<%		
	} else { //로그인 성공
		//아이디 기반으로 회원정보를 가져오는 작업.
		//아이디, 이름을 세션에 저장
		UserVO vo = dao.getInfo(id);
		String name = vo.getName(); //이름을 꺼냄
		
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", name);
	
		response.sendRedirect("user_mypage.jsp");
		
		
	}

%>










