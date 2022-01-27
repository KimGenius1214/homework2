<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.koreait.db.Dbconn"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.koreait.board.BoardDTO"%>
<%@ page import="com.koreait.board.BoardDAO"%>
<jsp:useBean id="member" class="com.koreait.board.BoardDTO"/>
<jsp:useBean id="reply" class="com.koreait.board.ReplyDTO"/>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="dao" class="com.koreait.board.BoardDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	List<BoardDTO> list = dao.selectAll();
	pageContext.setAttribute("list", list);
%>

	<c:set var="totalCount" value="${dao.page(member)}"/>
	<c:set var="totalReply" value="${dao.totalreply(reply)}"/>
	<c:set var="start" value="0"/>
	<c:set var="pagePerCount" value="15"/>
	<c:set var="pagenum" value='${requestScope.pagenum == null ? "" : requestScope.pagenum.equals("")}'/>
	<c:if test='${userid eq ""}'>
		<c:set var="pagenum" value="1"/>
	</c:if>
	<c:if test="${userid eq 'apple'}">
		<c:set var="start" value="${(pagenum-1)*pagePerCount}"/>
	</c:if>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 리스트</title>
</head>

<body>
    <h2>커뮤니티 - 리스트</h2>
    <p>게시글 : <c:out value="${totalCount}"/>개</p>
    <table border="1" width="800">
        <tr>
            <th width="50">번호</th>
            <th width="300">제목</th>
            <th width="100">글쓴이</th>
            <th width="75">조회수</th>
            <th width="200">날짜</th>
        </tr>

        <c:forEach var="list" items="${list}" varStatus="status">
        <tr align="center">
            <td>${list.getIdx()}</td>
            <td><a href="./view.jsp?b_idx=${list.getIdx()}">${list.getTitle()}

		<c:if test="${totalReply > 0 }">
			<c:out value="${totalReply}"/>
		</c:if>
            </td>
            <td>${list.getUserid()}</td>
            <td>${list.getHit()}</td>
            <td>${list.getRegdate()}</td>
        </tr>
        </c:forEach>
        <c:set var="pageNums" value="<%totalCount / pagePerCount)%>"/>

    <tr>
        <td colspan="6"><center>
    <c:forEach var="pagenum" items="${pagenum}" varStatus="status">
    <a href="./list.jsp?pagenum=${status.index + 1 }">${status.index + 1 }</a>
	</c:forEach>
        </center></td>
    </tr>
    
    </table>
    
    <p><input type="button" value="글쓰기" onclick="location.href='./write.jsp'"></p>
</body>
</html>