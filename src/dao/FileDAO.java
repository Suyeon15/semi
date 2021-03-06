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

import dto.FileDTO;

public class FileDAO {
	private FileDAO() {}
	private static FileDAO instance;
	public synchronized static FileDAO getInstance() {
		if(instance==null) {
			instance = new FileDAO();
		}return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	
	
	
	public int fileWrite(FileDTO dto) throws Exception {
		String sql ="insert into files values(file_seq.nextval, ?,?,sysdate,?)";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,dto.getOriName());
			pstat.setString(2,dto.getSysName());
			pstat.setInt(3, dto.getBoard_seq());
			
			int result =pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	//썸머노트 이미지 DB 저장
	public int summerWrite(FileDTO dto) throws Exception {
		String sql ="insert into summernote values(summer_seq.nextval, ?,?,sysdate,?)";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,dto.getOriName());
			pstat.setString(2,dto.getSysName());
			pstat.setInt(3, dto.getBoard_seq());
			
			int result =pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	
	public List<FileDTO> fileList(int board_seq) throws Exception {
		String sql ="select * from files where board_seq=?";
		List<FileDTO> flist = new ArrayList<FileDTO>();
		try(Connection con = this.getConnection();  
				PreparedStatement pstat = con.prepareStatement(sql);){
		pstat.setInt(1, board_seq);
		try(ResultSet rs = pstat.executeQuery()){
			while(rs.next()) {
				int file_seq = rs.getInt("file_seq");
				String oriName = rs.getString("oriname");
				String sysName = rs.getString("sysname");
				Date file_date = rs.getDate("file_date");
				
				flist.add(new FileDTO(file_seq,oriName,sysName,file_date,board_seq));
			}
		}return flist;
		}
	}
	
	
	
	
	
	
	
	
	//파일 삭제 메서드
	public int delete(int delTargetSeq) throws Exception {
		String sql ="delete from files where file_seq=?";
		try(Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, delTargetSeq);
			int result =pstat.executeUpdate();
			con.commit();
			return result;
		}	
	}
	//썸머노트의 이미지 파일 삭제 메서드 오버로딩
		public int delete(String sysName) throws Exception {
			String sql ="delete from summernote where sysname=?";
			try(Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setString(1, sysName);
				int result =pstat.executeUpdate();
				con.commit();
				return result;
			}	
		}
	
	
	//파일seq로 sysname 찾기
	public String getSysName(int file_seq) throws Exception {
		String sql ="select * from files where file_seq =?";
		String sysName=null;
		try(Connection con = this.getConnection();  
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, file_seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					 sysName= rs.getString("sysname");
				}return sysName;
			}
		}
	}
	
	
	//SessionListener 에게 썸머노트 이미지 DB 저장 여부 알려주는 메서드
	public boolean fileSaved(String sysName) throws Exception {
		String sql ="select * from summernote where sysname =?";
		
		try(Connection con = this.getConnection();  
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, sysName);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					 return true;
				}return false;
			}
		}
	}
	
	
	
	
}
