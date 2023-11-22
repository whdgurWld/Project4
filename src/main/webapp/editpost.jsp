<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project_4.dao.BoardDAO"%>
<%@ page import="com.example.project_4.common.FileUpload" %>
<%@ page import="com.example.project_4.bean.BoardVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.project_4.bean.BoardVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto(request);

	int i = boardDAO.updateBoard(u);
	response.sendRedirect("posts.jsp");
%>