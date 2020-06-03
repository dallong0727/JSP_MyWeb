<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>회원가입 페이지</h2>
		<hr>
		<form action="user_join_ok.jsp" method="post" name="regForm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="4글자 이상입니다"></td>			
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
					<td><input type="text" name="name"></td>			
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>			
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>			
				</tr>				
			</table>
			
			<br>
			<input type="button" value="가입하기" class="btn btn-default" onclick="check()">
			 
			<input type="button" value="로그인" class="btn btn-primary" onclick="location.href='user_login.jsp' ">
			
			
		</form>		
		
		</div>
	</section>

	<%@ include file="../include/footer.jsp" %>
	
	<script>
		function check() {
			
			//document.이름 형태로 form태그의 접근이 가능합니다.
			//console.log(document.regForm.id.value);
			if(document.regForm.id.value == '') {
				alert("아이디는 필수사항 입니다");
				return false;
			} else if(document.regForm.id.value.length < 4) {
				alert("아이디는 4글자 이상입니다");
				return false;
			} else if(document.regForm.pw.value.length < 4) {
				alert("비밀번호는 4글자 이상입니다");
				return false;
			} else if(document.regForm.pw.value != document.regForm.pw_check.value) {
				alert("비밀번호 확인란을 확인하세요");
				return false;
			} else if(document.regForm.name.value == '') {
				alert("이름은 필수사항 입니다");
				return false;
			} else if(confirm("회원가입을 하시겠습니까?")) { //confirm은 확인창, 예를 누르면 true반환, 아니오 누르면 false반환
				
				document.regForm.submit(); //자바스크립트의 서브밋 함수
			}
			
		}
	</script>
	
	
	
	
	
	
</body>
</html>




