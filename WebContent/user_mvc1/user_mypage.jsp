<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인증정보가 없으면 리다이렉트
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}

	String user_id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
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
		<h3><%=user_id %>(<%=user_name %>)님의 회원정보 입니다</h3>
		
		<a href="user_update.jsp">[정보 수정]</a>
		<a href="user_delete.jsp">[회원 탈퇴]</a>
		
		
		</div>
	</section>
		
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>