package dto;

import java.sql.Date;

public class Comments2DTO {
	   private int cmt_seq2;
	   private String id2;
	   private String cmt_content2;
	   private Date cmt_date2;
	   private int board_seq2;
	   
	   public Comments2DTO() {
	      super();
	   }
	   public Comments2DTO(int cmt_seq2, String id2, String cmt_content2, Date cmt_date2, int board_seq2) {
	      super();
	      this.cmt_seq2 = cmt_seq2;
	      this.id2 = id2;
	      this.cmt_content2 = cmt_content2;
	      this.cmt_date2 = cmt_date2;
	      this.board_seq2 = board_seq2;
	   }
	   public int getCmt_seq2() {
	      return cmt_seq2;
	   }
	   public void setCmt_seq2(int cmt_seq2) {
	      this.cmt_seq2 = cmt_seq2;
	   }
	   public String getId2() {
	      return id2;
	   }
	   public void setId2(String id2) {
	      this.id2 = id2;
	   }
	   public String getCmt_content2() {
	      return cmt_content2;
	   }
	   public void setCmt_content2(String cmt_content2) {
	      this.cmt_content2 = cmt_content2;
	   }
	   public Date getCmt_date2() {
	      return cmt_date2;
	   }
	   public void setCmt_date2(Date cmt_date2) {
	      this.cmt_date2 = cmt_date2;
	   }
	   public int getBoard_seq2() {
	      return board_seq2;
	   }
	   public void setBoard_seq2(int board_seq2) {
	      this.board_seq2 = board_seq2;
	   }
	   
	   

	}