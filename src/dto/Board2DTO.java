package dto;

import java.sql.Date;

public class Board2DTO {
	private int board_seq2;
	private String id2;
	private String title2;
	private String content2;
	private Date write_date2;
	private int view_count2;
	private String notice2;
	
	public Board2DTO() {
		super();
	}

	public Board2DTO(int board_seq2, String id2, String title2, String content2, Date write_date2, int view_count2,
			String notice2) {
		super();
		this.board_seq2 = board_seq2;
		this.id2 = id2;
		this.title2 = title2;
		this.content2 = content2;
		this.write_date2 = write_date2;
		this.view_count2 = view_count2;
		this.notice2 = notice2;
	}

	public int getBoard_seq2() {
		return board_seq2;
	}

	public void setBoard_seq2(int board_seq2) {
		this.board_seq2 = board_seq2;
	}

	public String getId2() {
		return id2;
	}

	public void setId2(String id2) {
		this.id2 = id2;
	}

	public String getTitle2() {
		return title2;
	}

	public void setTitle2(String title2) {
		this.title2 = title2;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public Date getWrite_date2() {
		return write_date2;
	}

	public void setWrite_date2(Date write_date2) {
		this.write_date2 = write_date2;
	}

	public int getView_count2() {
		return view_count2;
	}

	public void setView_count2(int view_count2) {
		this.view_count2 = view_count2;
	}

	public String getNotice2() {
		return notice2;
	}

	public void setNotice2(String notice2) {
		this.notice2 = notice2;
	}
	
	
	
	
}
