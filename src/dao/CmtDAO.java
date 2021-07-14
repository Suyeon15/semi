package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GameCmtDTO;
import dto.GameDTO;


public class CmtDAO {
	
	public CmtDAO() {}
	
	private static CmtDAO instance;
	
	public synchronized static CmtDAO getInstance() {
	      if(instance==null) {
	         instance = new CmtDAO();
	      }
	      return instance;
	   }
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insert(String id, String comments, int game_seq) throws Exception{

	      String sql = "insert into game_cmt values(gamecmt_seq.nextval,?,?,sysdate,?)";
	      try (Connection con = this.getConnection();   
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ) {  	  

	         pstat.setNString(1, id);
	         pstat.setNString(2, comments);
	    	 pstat.setInt(3, game_seq);
	         

	         int result = pstat.executeUpdate();

	         con.commit();
	         return result;

	      }
	   }
	
	  public List<GameCmtDTO> getAllList(int game_seq) throws Exception{
	      String sql = "select * from game_cmt where game_seq=? order by gamecmt_seq desc";

	      try(
	            Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ){
	    	  
	    	 pstat.setInt(1, game_seq);
	         ResultSet rs = pstat.executeQuery();

	         List<GameCmtDTO> list = new ArrayList<>();

	         while(rs.next()) {
	        	GameCmtDTO dto = new GameCmtDTO();
	            dto.setGame_seq(rs.getInt("game_seq"));
	            dto.setId(rs.getString("id"));
	            dto.setComments(rs.getNString("comments"));
	            dto.setReg_date(rs.getDate("reg_date"));
	            dto.setGamecmt_seq(rs.getInt("gamecmt_seq"));
	            list.add(dto);
	         }
	         return list;

	      }
	   }
	  
		public GameCmtDTO selectContents(int gamecmt_seq) throws Exception{

		      String sql = "select * from game_cmt where gamecmt_seq=?";
		      try (Connection con = this.getConnection();   
		            PreparedStatement pstat = con.prepareStatement(sql);
		            ) {

		         pstat.setInt(1, gamecmt_seq);

			         ResultSet rs = pstat.executeQuery();
			         GameCmtDTO dto = new GameCmtDTO();
		 	         
		 	         while(rs.next()) {
			            dto.setGame_seq(rs.getInt("game_seq"));
			            dto.setId(rs.getString("id"));
			            dto.setComments(rs.getNString("comments"));
			            dto.setReg_date(rs.getDate("reg_date"));
			            dto.setGamecmt_seq(rs.getInt("gamecmt_seq"));
		 	         }
		 	         
		 	         return dto;
		 	      }
		      
		   }
		
		public int Getseq() throws Exception{

		      String sql = "SELECT gamecmt_seq.NEXTVAL FROM DUAL";
		      try (Connection con = this.getConnection();   
		            PreparedStatement pstat = con.prepareStatement(sql);
		    		 ResultSet rs = pstat.executeQuery();
		            ) {
		    	 
	 	         rs.next();

		         return rs.getInt(1);
		      }
		   }
		
	     public int delete(int gamecmt_seq) throws Exception {
		  	   String sql = "delete from game_cmt where gamecmt_seq=?";
		  	   try(Connection con = this.getConnection();
		  		  PreparedStatement pstat = con.prepareStatement(sql);){
		  		   pstat.setInt(1,gamecmt_seq);
		  		   int result = pstat.executeUpdate();
		  		   
		  		   con.commit();
		  		   return result;
		  	   }
		     }
	     
	     public int modify(String comments, int gamecmt_seq) throws Exception{
	         String sql ="update game_cmt set comments=? where gamecmt_seq=?";
	         
	         try(Connection con = this.getConnection(); 
	               PreparedStatement pstat = con.prepareStatement(sql)){
	        	 
	            pstat.setString(1, comments);
	            pstat.setInt(2, gamecmt_seq);
	            int result =pstat.executeUpdate();
	            con.commit();
	            return result;
	         }
	      }
	
}
