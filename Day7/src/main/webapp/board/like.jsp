<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.koreait.db.Dbconn"%>
 <% 
 	String b_idx = request.getParameter("b_idx");
 
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	String sql = "";
 	
 	int like = 0;
 	
 	try {
 		conn = Dbconn.getConnection();
 		
 		if(conn != null){
 			sql = "select b_like from tb_board where b_idx=?";
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, b_idx);
 			rs = pstmt.executeQuery();
 			if(rs.next()){
 				like = rs.getInt(1);
 				like++;
 			}
 			
 			sql = "update tb_board set b_like=? where b_idx=?";
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1,like);
 			pstmt.setString(2,b_idx);
 			pstmt.executeUpdate();
 			
 			out.println(like);
 		}
 		
 		
 	}catch(Exception e){
 		e.printStackTrace();
 	}
 
 
 %>
