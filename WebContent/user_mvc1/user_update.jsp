<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	이 페이지에 진입했을 떄 getInfo()를 이용해서 모든 회원정보를 불러온 후에
	아래에 input 태그에 해당하는 값을 보여주세요 (pw 제외)
	*/
	
	//세션에서 아이디값을 얻음
	String id = (String)session.getAttribute("user_id");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.getInfo(id); //회원정보를 얻어오는 메서드

%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">

    <title>Welcome to MyWorld</title>
	
	<!-- 외부 CSS파일을  임포트 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>


</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<section>
		<div align="center">
		<h2>정보수정 페이지</h2>
		<hr>
		<form action="user_update_ok.jsp" method="post" name="regForm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="4글자 이상입니다" value="<%=id %>"  readonly></td>			
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" placeholder="4글자 이상입니다" > </td>			
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="pw_check"></td>			
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=vo.getName() %>"></td>			
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="<%=vo.getEmail() %>"></td>			
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%=vo.getAddress() %>"></td>			
				</tr>				
			</table>
			
			<br>
			<input type="button" value="정보 수정" class="btn btn-default" onclick="check()">
			 
			<input type="button" value="내 정보" class="btn btn-primary" onclick="location.href='user_mypage.jsp' ">
			
			
		</form>		
		
		</div>
	</section>
	

	<%@ include file="../include/footer.jsp" %>


	<script>
		//폼 검증 함수
		function check() {
			
			if(document.regForm.pw.value.length < 4 ) {
				alert("비밀번호는 4글자 이상입니다");
				return false;
			} else if(document.regForm.pw.value != document.regForm.pw_check.value ) {
				alert("비밀번호 확인란을 확인하세요");
				document.regForm.pw_check.focus();//해당 태그에 마우스 포커스
				return false;
			} else if(document.regForm.name.value == '') {
				alert("이름은 필수 입니다");
				return false;
			} else if(confirm("수정 하시겠습니까?") ) {
				
				document.regForm.submit();
			}
			
		}
	</script>





</body>
</html>