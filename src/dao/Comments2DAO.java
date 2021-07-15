package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Comments2DTO;


public class Comments2DAO {
	
		   private static Comments2DAO instance = null;
		   public synchronized static Comments2DAO getInstance() {
		      if(instance == null) {
		         instance = new Comments2DAO();
		      }
		      return instance;
		   }

		   private Comments2DAO() {}

		   private Connection getConnection() throws Exception{
		      Context ctx = new InitialContext();
		      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		      return ds.getConnection();
		   }

		   public int insert(int cmt_seq2, String id2, String cmt_content2, int board_seq2) throws Exception {
		      String sql = "insert into comments2 values(?,?,?,sysdate,?)";
		      try(
		            Connection con = this.getConnection();
		            PreparedStatement pstat = con.prepareStatement(sql);
		            ){
		         pstat.setInt(1, cmt_seq2);
		         pstat.setString(2, id2);
		         pstat.setString(3, cmt_content2);
		         pstat.setInt(4, board_seq2);

		         int result = pstat.executeUpdate();
		         return result;
		      }
		   }

		   public int getcmt_seq() throws Exception{
		      String sql = "select cmt_seq2.nextval from dual";
		      try(
		            Connection con = this.getConnection();
		            PreparedStatement pstat = con.prepareStatement(sql);
		            ResultSet rs = pstat.executeQuery();
		            ){
		         rs.next();
		         return rs.getInt(1);
		      }
		   }


		   public List<Comments2DTO> getCommentsList(int board_seq2) throws Exception{
		      String sql = "select * from comments2 where board_seq2 =? order by cmt_seq2 desc";
		      try(
		            Connection con = this.getConnection();
		            PreparedStatement pstat = con.prepareStatement(sql);){
		         pstat.setInt(1,board_seq2);

		         try(ResultSet rs = pstat.executeQuery();){
		            List<Comments2DTO> list = new ArrayList<>();

		            while(rs.next()) {

		               int seq2 = rs.getInt("cmt_seq2");
		               String id2 = rs.getString("id2");
		               String cmt_content2 = rs.getString("cmt_content2");
		               Date cmt_date2 = rs.getDate("cmt_date2");

		               Comments2DTO dto = new Comments2DTO(seq2,id2,cmt_content2,cmt_date2,board_seq2);
		               list.add(dto);
		            }
		            return list;
		         }
		      }
		   }

		   public int delete(int cmt_seq2) throws Exception{
		      String sql = "delete from comments2 where cmt_seq2=?";

		      try(
		            Connection con = this.getConnection();
		            PreparedStatement pstat = con.prepareStatement(sql);){
		         pstat.setInt(1, cmt_seq2);

		         int result = pstat.executeUpdate();
		         con.commit();
		         return result;
		      }   
		   }

		   public Comments2DTO getComments(int cmt_seq2) throws Exception{
		      String sql = "select * from comments2 where cmt_seq2=?";
		      try(
		            Connection con = this.getConnection();
		            PreparedStatement pstat = con.prepareStatement(sql);){

		         Comments2DTO dto = new Comments2DTO();
		         pstat.setInt(1,cmt_seq2);

		         try(ResultSet rs = pstat.executeQuery();){

		            if(rs.next()) {

		               String id2 = rs.getString("id2");
		               String cmt_content2 = rs.getString("cmt_content2");
		               Date cmt_date2 = rs.getDate("cmt_date2");
		               int board_seq2 = rs.getInt("board_seq2");

		               dto.setId(id2);
		               dto.setCmt_seq(cmt_seq2);
		               dto.setCmt_content(cmt_content2);
		               dto.setCmt_date(cmt_date2);
		               dto.setBoard_seq(board_seq2);
		            }
		            return dto;
		         }
		      }
		   }
		   
		   public int modify(String cmt_content2, int cmt_seq2) throws Exception{
		      String sql ="update comments2 set cmt_content2=? where cmt_seq2=?";
		      try(Connection con = this.getConnection(); 
		            PreparedStatement pstat = con.prepareStatement(sql)){
		         pstat.setString(1, cmt_content2);
		         pstat.setInt(2, cmt_seq2);
		         int result =pstat.executeUpdate();
		         con.commit();
		         return result;
		      }
		   }



}
