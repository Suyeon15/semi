package dto;

import java.sql.Date;

public class GameCmtDTO {
	
	private int cmt_seq;
	private String id;
	private String comments;
	private Date reg_date;
	private int game_seq;
	
	public GameCmtDTO() {
		super();
	}

	public GameCmtDTO(int cmt_seq, String id, String comments, Date reg_date, int game_seq) {
		super();
		this.cmt_seq = cmt_seq;
		this.id = id;
		this.comments = comments;
		this.reg_date = reg_date;
		this.game_seq = game_seq;
	}

	public int getCmt_seq() {
		return cmt_seq;
	}

	public void setCmt_seq(int cmt_seq) {
		this.cmt_seq = cmt_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getGame_seq() {
		return game_seq;
	}

	public void setGame_seq(int game_seq) {
		this.game_seq = game_seq;
	}
	
	
	
}
