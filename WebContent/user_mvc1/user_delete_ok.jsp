<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. DAO연동후에 login()메서드로 아이디, 비밀번호가 맞는지 검증합니다.
	2. login()메서드가 0을 반환하면 "현재 비밀번호를 확인하세요"를 출력하고 뒤로가기
	   login()메서드가 1을 반환하면 delete()메서드를 호출해서 삭제를 진행하면 됩니다.
	   
	   삭제 성공시 세션을 전부 지우고 index페이지로 리다이렉트
	   삭제 실패시 마이페이지로 리다이렉트 
	*/

	//아이디는 세션에서 얻음
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.login(id, pw); //아이디 비밀번호 검증
	
	
	if(result == 0) { //비밀번호를 잘못 적은경우
%>
	<script>
		alert("현재 비밀번호를 확인하세요");
		history.go(-1);
	</script>
<%		
	} else { //아이디 비밀번호가 일치하는 경우
		
		int result2 = dao.delete(id);
		
		if(result2 == 1) { //탈퇴성공
			session.invalidate();//세션삭제
			response.sendRedirect("/MyWeb");			
			
		} else { //탈퇴실패
%>


		<script>
			alert("회원 탈퇴에 실패했습니다. 관리자에게 문의하세요");	
			location.href = "user_mypage.jsp";
		</script>		
<%
		}
	}
%>



