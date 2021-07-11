package dto;

import java.sql.Date;

public class GameDTO {
   
   private int game_seq;
   private String game_name;
   private String category;
   private String explain;
   private String link;
   private String image;
   private int count;
   private double rating;
   private String detail_image;
   
   
   public GameDTO() {
      super();
   }


   public GameDTO(int game_seq, String game_name, String category, String explain, String link, String image,
         int count, double rating, String detail_image) {
      super();
      this.game_seq = game_seq;
      this.game_name = game_name;
      this.category = category;
      this.explain = explain;
      this.link = link;
      this.image = image;
      this.count = count;
      this.rating = rating;
      this.detail_image = detail_image;
   }


   public int getGame_seq() {
      return game_seq;
   }


   public void setGame_seq(int game_seq) {
      this.game_seq = game_seq;
   }


   public String getGame_name() {
      return game_name;
   }


   public void setGame_name(String game_name) {
      this.game_name = game_name;
   }


   public String getCategory() {
      return category;
   }


   public void setCategory(String category) {
      this.category = category;
   }


   public String getExplain() {
      return explain;
   }


   public void setExplain(String explain) {
      this.explain = explain;
   }


   public String getLink() {
      return link;
   }


   public void setLink(String link) {
      this.link = link;
   }


   public String getImage() {
      return image;
   }


   public void setImage(String image) {
      this.image = image;
   }


   public int getCount() {
      return count;
   }


   public void setCount(int count) {
      this.count = count;
   }


   public double getRating() {
      //return rating;
      return rating = (Math.round(rating*10)/10.0);
   }


   public void setRating(double rating) {
      this.rating = rating;
   }

   public String getDetail_image() {
      return detail_image;
   }


   public void setDetail_image(String detail_image) {
      this.detail_image = detail_image;
   }

}