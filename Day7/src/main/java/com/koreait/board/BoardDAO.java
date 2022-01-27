package com.koreait.board;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

import com.koreait.db.Dbconn;

public class BoardDAO {

    Connection conn = Dbconn.getConnection();
    private BoardDTO board;
    private ReplyDTO reply;
    PreparedStatement pstmt;
    ResultSet rs ;
    
    String sql = "";

    public List<BoardDTO> selectAll(){
    	int start = 0;
    	int pagePerCount = 15;
    	List<BoardDTO> res = new ArrayList<BoardDTO>();
    	try {
    		
    		sql="select * from tb_board order by b_idx desc limit ?, ?";
    		pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, pagePerCount);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			BoardDTO dto = new BoardDTO();
    			dto.setIdx(rs.getInt("b_idx"));
    			dto.setUserid(rs.getString("b_userid"));
    			dto.setTitle(rs.getString("b_title"));
    			dto.setRegdate(rs.getString("b_regdate").substring(0, 10));
    			dto.setHit(rs.getInt("b_hit"));
    			dto.setLike(rs.getInt("b_like"));
    			
    			res.add(dto);
    					
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return res;
    }

    public BoardDTO selectOne(int idx) {
    	BoardDTO res = null;
    	try { 
    		sql= "update tb_board set b_hit = b_hit + 1 where b_idx = ? ";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, idx);
    		pstmt.executeUpdate();
    		
    		sql= "select * from tb_board where b_idx=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, idx);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			res = new BoardDTO();
    			res.setIdx(rs.getInt("b_idx"));
    			res.setTitle(rs.getString("b_title"));
    			res.setRegdate(rs.getString("b_regdate"));
    			res.setUserid(rs.getString("b_userid"));
    			res.setHit(rs.getInt("b_hit"));
    			res.setContent(rs.getString("b_content"));
    			res.setFile(rs.getString("b_file"));
    		}
    		

    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return res;
    }
    
    public int insert(BoardDTO board) {
    	int res = 0;
    	try {
    		
    		sql="insert into tb_board(b_userid, b_title, b_content, b_file) values(?, ?, ?, ?)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, board.getUserid());
    		pstmt.setString(2, board.getTitle());
    		pstmt.setString(3, board.getContent());
    		pstmt.setString(4, board.getFile());
    		
    		res = pstmt.executeUpdate();
    		
    
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return res;
    }
    
    public int edit(BoardDTO board) {
    	int res = 0;
    	try {
             	if(board.getFile() != null && !board.getFile().equals("")){
             		sql = "update tb_board set b_title = ?, b_content = ?, b_file = ? where b_idx = ?";
             		pstmt = conn.prepareStatement(sql);
                     pstmt.setString(1, board.getTitle());
                     pstmt.setString(2, board.getContent());
                     pstmt.setString(3, board.getFile());
                     pstmt.setInt(4, board.getIdx());
                     res = pstmt.executeUpdate();
             	}else{
             		  sql = "update tb_board set b_title = ?, b_content = ? where b_idx = ?";
                       pstmt = conn.prepareStatement(sql);
                       pstmt.setString(1, board.getTitle());
                       pstmt.setString(2, board.getContent());
                       pstmt.setInt(3, board.getIdx());
                       res = pstmt.executeUpdate();
             	}

    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return res;
    }
    
    public int delete(BoardDTO board) {
    	int res = 0;
    	try{
                sql = "delete from tb_board where b_idx = ?";
                pstmt = conn.prepareStatement(sql);;
                pstmt.setInt(1, board.getIdx());
                res = pstmt.executeUpdate();

        }catch(Exception e){
               e.printStackTrace();
        }
    	return res;
    }
    
    
    public int page(BoardDTO board) {
    	int totalCount = 0;
    	try{
    	sql = "select count(b_idx) as total from tb_board";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        if(rs.next()){
            totalCount = rs.getInt("total");
        } 
        }catch(Exception e){
            e.printStackTrace();
     }
 	return totalCount;
    }
    
    public int totalreply(ReplyDTO reply) {
    	int totalReply = 0;
    	try{
    	sql = "select count(r_idx) as totalReply from tb_reply where r_boardidx= ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, reply.getBoardidx());
        rs = pstmt.executeQuery();
        if(rs.next()){
        	totalReply = rs.getInt("totalReply");
        }
    	}catch(Exception e){
            e.printStackTrace();
     }
    	return totalReply;
    }
    
    
    public int reply_ok(ReplyDTO reply) {
    	int res =0;
    	try{
                sql = "insert into tb_reply (r_user, r_content, r_boardidx) values (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, reply.getUser());
                pstmt.setString(2, reply.getContent());
                pstmt.setInt(3, reply.getBoardidx());

                res = pstmt.executeUpdate();

        }catch(Exception e){
                e.printStackTrace();
        }
    	return res;
    }
    
    public List<ReplyDTO> reply_see(int idx){
    	List<ReplyDTO> res = new ArrayList<ReplyDTO>();
    	try {
    	sql = "select r_idx, r_user, r_content, r_regdate from tb_reply where r_boardidx= ? order by r_idx desc";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        rs = pstmt.executeQuery();
        
		    while(rs.next()){
		    	ReplyDTO dto = new ReplyDTO();
		    	dto.setUser(rs.getString("r_user"));
		    	dto.setContent(rs.getString("r_content"));
		    	dto.setRegdate(rs.getString("r_regdate"));
		    	dto.setIdx(rs.getInt("r_idx"));
		    	res.add(dto);
		    }
    	}catch(Exception e){
            e.printStackTrace();
    }
	return res;
    }
    	
    public int imgcheck(BoardDTO board) {
    	int res = 0;
    	try {
        	sql = "select count(b_file) from tb_board where b_idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board.getIdx());
          
            rs = pstmt.executeQuery();
           
    		    while(rs.next()){
    		    	res = 1;
    		    }
        	}catch(Exception e){
                e.printStackTrace();
        }
    	return res;
    }
}
    

