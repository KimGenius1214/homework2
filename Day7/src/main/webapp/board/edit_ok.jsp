<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.koreait.db.Dbconn"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("userid") == null){
%>
	<script>
		alert('로그인 후 이용하세요');
		location.href="../login.jsp";
	</script>
<%
	}else{
/* 		String b_idx = request.getParameter("b_idx");
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content"); */
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		String uploadPath = request.getRealPath("upload");
		System.out.println(uploadPath);
		int size = 1024*1024*10;
		
		String b_idx = "";
		
		try{
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			b_idx = multi.getParameter("b_idx");
			String b_title = multi.getParameter("b_title");
			String b_content = multi.getParameter("b_content");
			String b_file = multi.getFilesystemName("b_file");
			
			conn = Dbconn.getConnection();
			if(conn != null){
				if(b_file != null && !b_file.equals("")){
					sql = "update tb_board set b_title=?, b_content=?, b_file=? where b_idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, b_title);
					pstmt.setString(2, b_content);
					pstmt.setString(3, b_file);
					pstmt.setString(4, b_idx);
					pstmt.executeUpdate();
				}else{	
					sql = "update tb_board set b_title=?, b_content=? where b_idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, b_title);
					pstmt.setString(2, b_content);
					pstmt.setString(3, b_idx);
					pstmt.executeUpdate();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
%>
	<script>
		alert('수정되었습니다');
		location.href="./view.jsp?b_idx=<%=b_idx%>";
	</script>
<%	
	}
%>
