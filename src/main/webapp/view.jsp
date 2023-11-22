<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.project_4.dao.BoardDAO, com.example.project_4.bean.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 정보</title>
</head>

<body>

<%
	BoardDAO dao = new BoardDAO();
	String id = request.getParameter("id");
	BoardVO u = dao.getBoard(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

    <h1>회원 정보 보기 </h1>
    <table id="edit">
        <tr>
            <td>Category: </td><td>${vo.getCategory()}</td>
        </tr>
        <tr>
            <td>Title: </td><td>${vo.getTitle()}</td>
        </tr>
        <tr>
            <td>Photo: </td><td><c:if test="${vo.getPhoto() ne ''}"><br />
            <img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="photo" width="300"> </c:if></td>
        </tr>
        <tr>
            <td>Writer: </td><td>${vo.getWriter()}</td>
        </tr>
        <tr>
            <td>Content: </td><td>${vo.getContent()}</td>
        </tr>
    </table>

    <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
    <button type="button" onclick="location.href='editform.jsp?id=${vo.getSeq()}'">수정하기</button>

</body>
</html>
