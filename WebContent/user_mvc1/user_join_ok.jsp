<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");

	
	//아이디 중복검사
	//DAO객체생성
	UserDAO dao = UserDAO.getInstance();
	int result = dao.checkId(id);
	
	if(result == 1) { //아이디 중복
%>
	<script>
		alert("아이디가 중복되었습니다");
		history.go(-1); //뒤로가기
	</script>
<%		
	} else {
		UserVO vo = new UserVO(id, pw, name, email, address, null);
		int result2 = dao.insert(vo);
		
		if(result2 == 1) { //가입 성공
%>			
		<script>
			alert("회원가입을 축하합니다");
			location.href = "user_login.jsp";
		</script>
<%			
		} else { //가입 실패
%>			
		<script>
			alert("회원가입에 실패했습니다");
			location.href ="user_join.jsp";
		</script>	
	
<%			
		}
	}
%>






