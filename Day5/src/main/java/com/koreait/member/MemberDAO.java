package com.koreait.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.koreait.db.Dbconn;

public class MemberDAO {

    Connection conn = Dbconn.getConnection();
    private MemberDTO member;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "";

    public int join(MemberDTO member) {
        try{
            if(conn != null){
               sql = "insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, member.getUserid());
               pstmt.setString(2, member.getUserpw());
               pstmt.setString(3, member.getUsername());
               pstmt.setString(4, member.getHp());
               pstmt.setString(5, member.getEmail());
               String hobbystr = "";
               for(String hobby : member.getHobby()) {
                   hobbystr = hobbystr + hobby + " ";
               }
               pstmt.setString(6, hobbystr);
               pstmt.setString(7, member.getSsn1());
               pstmt.setString(8, member.getSsn2());
               pstmt.setString(9, member.getZipcode());
               pstmt.setString(10, member.getAddress1());
               pstmt.setString(11, member.getAddress2());
               pstmt.setString(12, member.getAddress3());
               if(pstmt.executeUpdate() > 0) {
                   return 1;
               }
           }
         }catch(Exception e){
            e.printStackTrace();
         }
        return 0;
    }
    
    public MemberDTO login(MemberDTO member) {
    	try {
    		if(conn!= null) {
    			sql= "select mem_idx, mem_name mem_userid from tb_member where mem_userid= ? and mem_userpw= ?";
    			pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, member.getUserid());
                pstmt.setString(2, member.getUserpw());
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                    member.setIdx(rs.getInt(1));
                  member.setUsername(rs.getString(2));
                   
    		}
    		}
    	}catch(Exception e){
            e.printStackTrace();
         }
    	return member;
    }
    
    public int login_ok(String userid,  String userpw) {		
    	int ok = 0;
    	try {
    	sql="select mem_userpw from tb_member where mem_userid= ?";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, userid);
    	rs = pstmt.executeQuery();

    	if(rs.next()) {
    		if(rs.getString("mem_userpw").equals(userpw)) {
    			ok = 1;
    		}else {
    			ok = 2;
    		}
    	}
    	
    }catch(Exception e) {
    	e.printStackTrace();
    }
    return ok;
    }
   
    
	public MemberDTO info(MemberDTO member) throws SQLException {
		try {
			conn = Dbconn.getConnection();

			sql = "select mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3 from tb_member where mem_userid=?";
			pstmt = conn.prepareStatement(sql); // ?????????
			pstmt.setString(1, member.getUserid());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setUsername(rs.getString("mem_name"));
				member.setHp(rs.getString("mem_hp"));
				member.setEmail(rs.getString("mem_email"));
				member.setHobby(rs.getString("mem_hobby").split(" "));
				member.setSsn1(rs.getString("mem_ssn1"));
				member.setSsn2(rs.getString("mem_ssn2"));
				member.setZipcode(rs.getString("mem_zipcode"));
				member.setAddress1(rs.getString("mem_address1"));
				member.setAddress2(rs.getString("mem_address2"));
				member.setAddress3(rs.getString("mem_address3"));

				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
   
    public int edit(MemberDTO member){
    	try {
            if(conn != null){
         	   sql = "update tb_member set mem_name= ?, mem_hp= ?, mem_email= ?, mem_hobby= ?,mem_zipcode= ?, mem_address1= ?, mem_address2= ?, mem_address3= ? where mem_userid= ?";
 	       		pstmt = conn.prepareStatement(sql);
 	       		pstmt.setString(1, member.getUsername());
 	       		pstmt.setString(2, member.getHp());
 	       		pstmt.setString(3, member.getEmail());
                String hobbystr = "";
                for(String hobby : member.getHobby()) {
                    hobbystr = hobbystr + hobby + " ";
                }
                pstmt.setString(4, hobbystr);
 	       		pstmt.setString(5, member.getZipcode());
 	       		pstmt.setString(6, member.getAddress1());
 	       		pstmt.setString(7, member.getAddress2());
 	       		pstmt.setString(8, member.getAddress3());
 	       		pstmt.setString(9, member.getUserid());
 	       		pstmt.executeUpdate();
 	       		if(pstmt.executeUpdate() > 0) {
                return 1;
 	       		}
 	       		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    		return 0;
    }
}

