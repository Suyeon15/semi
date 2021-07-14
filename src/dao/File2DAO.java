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

import dto.File2DTO;

public class File2DAO {
	private File2DAO() {}
	private static File2DAO instance;
	public synchronized static File2DAO getInstance() {
		if(instance==null) {
			instance = new File2DAO();
		}return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	
	
	
	public int fileWrite(File2DTO dto) throws Exception {
		String sql ="insert into files2 values(file_seq2.nextval, ?,?,sysdate,?)";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,dto.getOriName2());
			pstat.setString(2,dto.getSysName2());
			pstat.setInt(3, dto.getBoard_seq2());
			
			int result =pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	//썸머노트 이미지 DB 저장
	public int summerWrite(File2DTO dto) throws Exception {
		String sql ="insert into summernote2 values(summer_seq2.nextval, ?,?,sysdate,?)";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,dto.getOriName2());
			pstat.setString(2,dto.getSysName2());
			pstat.setInt(3, dto.getBoard_seq2());
			
			int result =pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	
	public List<File2DTO> fileList(int board_seq2) throws Exception {
		String sql ="select * from files2 where board_seq2=?";
		List<File2DTO> flist = new ArrayList<File2DTO>();
		try(Connection con = this.getConnection();  
				PreparedStatement pstat = con.prepareStatement(sql);){
		pstat.setInt(1, board_seq2);
		try(ResultSet rs = pstat.executeQuery()){
			while(rs.next()) {
				int file_seq2 = rs.getInt("file_seq2");
				String oriName2 = rs.getString("oriname2");
				String sysName2 = rs.getString("sysname2");
				Date file_date2 = rs.getDate("file_date2");
				
				flist.add(new File2DTO(file_seq2,oriName2,sysName2,file_date2,board_seq2));
			}
		}return flist;
		}
	}
	
	
	
	
	
	
	
	
	//파일 삭제 메서드
	public int delete(int delTargetSeq2) throws Exception {
		String sql ="delete from files2 where file_seq2=?";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, delTargetSeq2);
			int result =pstat.executeUpdate();
			con.commit();
			return result;
		}	
	}
	//썸머노트의 이미지 파일 삭제 메서드 오버로딩
		public int delete(String sysName2) throws Exception {
			String sql ="delete from summernote2 where sysname2=?";
			try(Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setString(1, sysName2);
				int result =pstat.executeUpdate();
				con.commit();
				return result;
			}	
		}
	
	
	//파일seq로 sysname 찾기
	public String getSysName(int file_seq2) throws Exception {
		String sql ="select * from files2 where file_seq2 =?";
		String sysName2=null;
		try(Connection con = this.getConnection();  
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, file_seq2);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					 sysName2= rs.getString("sysname2");
				}return sysName2;
			}
		}
	}
	
	
	//SessionListener 에게 썸머노트 이미지 DB 저장 여부 알려주는 메서드
	public boolean fileSaved(String sysName2) throws Exception {
		String sql ="select * from summernote2 where sysname2 =?";
		
		try(Connection con = this.getConnection();  
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, sysName2);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					 return true;
				}return false;
			}
		}
	}
	
	
	
	
}
