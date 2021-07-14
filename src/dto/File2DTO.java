package dto;

import java.sql.Date;

public class File2DTO {
	private int file_seq2;
	private String oriName2;
	private String sysName2;
	private Date file_date2;
	private int board_seq2;
	
	
	public File2DTO() {
		super();
	}
	
	
	public File2DTO(int file_seq2, String oriName2, String sysName2, Date file_date2, int board_seq2) {
		super();
		this.file_seq2 = file_seq2;
		this.oriName2 = oriName2;
		this.sysName2 = sysName2;
		this.file_date2 = file_date2;
		this.board_seq2 = board_seq2;
	}


	public int getFile_seq2() {
		return file_seq2;
	}


	public void setFile_seq2(int file_seq2) {
		this.file_seq2 = file_seq2;
	}


	public String getOriName2() {
		return oriName2;
	}


	public void setOriName2(String oriName2) {
		this.oriName2 = oriName2;
	}


	public String getSysName2() {
		return sysName2;
	}


	public void setSysName2(String sysName2) {
		this.sysName2 = sysName2;
	}


	public Date getFile_date2() {
		return file_date2;
	}


	public void setFile_date2(Date file_date2) {
		this.file_date2 = file_date2;
	}


	public int getBoard_seq2() {
		return board_seq2;
	}


	public void setBoard_seq2(int board_seq2) {
		this.board_seq2 = board_seq2;
	}
	
	
	
	
	
	
	
}
