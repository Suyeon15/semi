package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GameDTO;



public class GameDAO {

	private static GameDAO instance = null;
	public synchronized static GameDAO getInstance() {
		if(instance == null) {
			instance = new GameDAO();
		}
		return instance;
	}

	private GameDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}// JNDI

	public List<GameDTO> getAllList() throws Exception{
		String sql = "select * from game";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			List<GameDTO> allList = new ArrayList<>();
				
				
			while(rs.next()) {
				GameDTO dto = new GameDTO(rs.getInt("game_seq"),rs.getNString("game_name"),rs.getNString("category"),rs.getNString("explain"),rs.getNString("link"),rs.getNString("image"),rs.getInt("count"),rs.getDouble("rating"),rs.getNString("detail_image"));
//				dto.setGame_id(rs.getInt("F"));
//				dto.setGame_name(rs.getNString("game_name"));
//				dto.setImage(rs.getNString("image"));
//				dto.setLink(rs.getNString("link"));
				allList.add(dto);
			}
			return allList;
		}
	}

	public List<GameDTO> getPopularList() throws Exception{
		String sql = "select * from game order by rating desc";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			List<GameDTO> poList = new ArrayList<>();

			while(rs.next()) {
				GameDTO dto = new GameDTO(rs.getInt("game_seq"),rs.getNString("game_name"),rs.getNString("category"),rs.getNString("explain"),rs.getNString("link"),rs.getNString("image"),rs.getInt("count"),rs.getDouble("rating"),rs.getNString("detail_image"));
				poList.add(dto);
			}
			return poList;
		}
	}

	public List<GameDTO> rpgList(String rpg) throws Exception{
		String sql = "select * from game where category =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, rpg);

			try(ResultSet rs = pstat.executeQuery();){
				List<GameDTO> rList = new ArrayList<>();
				while(rs.next()) {
					GameDTO dto = new GameDTO(rs.getInt("game_seq"),rs.getNString("game_name"),rs.getNString("category"),rs.getNString("explain"),rs.getNString("link"),rs.getNString("image"),rs.getInt("count"),rs.getDouble("rating"),rs.getNString("detail_image"));					rList.add(dto);
					
				}
				return rList;
			}
		}
	}
	
	public List<GameDTO> shootList(String shooting) throws Exception{
		String sql = "select * from game where category =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, shooting);

			try(ResultSet rs = pstat.executeQuery();){
				List<GameDTO> sList = new ArrayList<>();
				while(rs.next()) {
					GameDTO dto = new GameDTO(rs.getInt("game_seq"),rs.getNString("game_name"),rs.getNString("category"),rs.getNString("explain"),rs.getNString("link"),rs.getNString("image"),rs.getInt("count"),rs.getDouble("rating"),rs.getNString("detail_image"));					sList.add(dto);
					
				}
				return sList;
			}
		}
	}

	public List<GameDTO> arcadeList(String arcade) throws Exception{
		String sql = "select * from game where category =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, arcade);

			try(ResultSet rs = pstat.executeQuery();){
				List<GameDTO> aList = new ArrayList<>();
				while(rs.next()) {
					GameDTO dto = new GameDTO(rs.getInt("game_seq"),rs.getNString("game_name"),rs.getNString("category"),rs.getNString("explain"),rs.getNString("link"),rs.getNString("image"),rs.getInt("count"),rs.getDouble("rating"),rs.getNString("detail_image"));					aList.add(dto);
					
				}
				return aList;
			}
		}
	}
	
	public List<GameDTO> etcList(String etc) throws Exception{
		String sql = "select * from game where category =?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, etc);

			try(ResultSet rs = pstat.executeQuery();){
				List<GameDTO> aList = new ArrayList<>();
				while(rs.next()) {
					GameDTO dto = new GameDTO(rs.getInt("game_seq"),rs.getNString("game_name"),rs.getNString("category"),rs.getNString("explain"),rs.getNString("link"),rs.getNString("image"),rs.getInt("count"),rs.getDouble("rating"),rs.getNString("detail_image"));					aList.add(dto);
					
				}
				return aList;
			}
		}
	}
		
	   public GameDTO selectContents(int seq) throws Exception{

	         String sql = "select * from game where game_seq=?";
	         try (Connection con = this.getConnection();   
	               PreparedStatement pstat = con.prepareStatement(sql);
	               ) {

	            pstat.setInt(1, seq);

	               ResultSet rs = pstat.executeQuery();
	               GameDTO dto = new GameDTO();
	                
	                while(rs.next()) {
	                   dto.setGame_seq(rs.getInt("game_seq"));
	                   dto.setGame_name(rs.getString("game_name"));
	                   dto.setCategory(rs.getNString("category"));
	                   dto.setExplain(rs.getNString("explain"));
	                   dto.setImage(rs.getNString("image"));
	                   dto.setDetail_image(rs.getString("detail_image"));
	                   dto.setRating(rs.getDouble("rating"));
	                   dto.setLink(rs.getNString("link"));
	                   dto.setCount(rs.getInt("count"));
	                         
	                }
	                
	                return dto;
	             }
	      }
		
		
		public int Setrating(double rating,int game_seq) throws Exception{

		      String sql = "update game set rating=? where game_seq=?";
		      try (Connection con = this.getConnection();   
		            PreparedStatement pstat = con.prepareStatement(sql);
		            ) {

		         pstat.setDouble(1, rating);
		         pstat.setInt(2, game_seq);

		         int result = pstat.executeUpdate();

		         con.commit();
		         return result;

		      }
		   }
		
		
		public double Getrating(int game_seq) throws Exception{

		      String sql = "select rating from game where game_seq=?";
		      try (Connection con = this.getConnection();   
		            PreparedStatement pstat = con.prepareStatement(sql);
		    		  ) {
		    	  
		    	  pstat.setInt(1, game_seq);
		    	  ResultSet rs = pstat.executeQuery();
		    	 
					rs.next();
					System.out.println(rs.getDouble(1));
					return rs.getDouble(1);						

		 	      }   
		}
		

			public int SetCount(int count, int game_seq) throws Exception{

				String sql = "update game set count=? where game_seq=?";
			      try (Connection con = this.getConnection();   
			            PreparedStatement pstat = con.prepareStatement(sql);
			            ) { 
			    	  
			    	 count= count+1;
			         pstat.setInt(1, count);
			         System.out.println("count+1= "+ count );
			         pstat.setInt(2, game_seq);

			         int result = pstat.executeUpdate();

			         con.commit();
			         return result;

			      }
			   }
			
			public int GetCount(int game_seq) throws Exception {
				String sql = "select count from game where game_seq=?";
				try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					) {
					
					pstat.setInt(1, game_seq);
					ResultSet rs = pstat.executeQuery();
					
					rs.next();
					System.out.println("getcount= " + rs.getInt(1));
					return rs.getInt(1);	
				}
			}
}
