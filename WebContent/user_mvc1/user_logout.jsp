<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션정보 삭제
	response.sendRedirect("user_login.jsp"); //페이지 이동

%>