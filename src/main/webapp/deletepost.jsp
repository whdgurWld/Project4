<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project_4.dao.BoardDAO, com.example.project_4.bean.BoardVO, com.example.project_4.common.FileUpload"%>
<%
	String seq = request.getParameter("id");
	if (seq != ""){
		int id = Integer.parseInt(seq);
		BoardVO u = new BoardVO();

		u.setSeq(id);
		BoardDAO boardDAO = new BoardDAO();
		String filename = boardDAO.getPhotoFilename(id);

		if(filename != null)
			FileUpload.deleteFile(request, filename);

		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>