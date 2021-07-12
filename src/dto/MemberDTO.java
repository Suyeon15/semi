package dto;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String postal;
	private String address1;
	private String address2;
	
	
	public MemberDTO() {}
	
	public MemberDTO(String id, String pw, String name, String email, String phone, String postal, String address1, String address2) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.postal = postal;
		this.address1 = address1;
		this.address2 = address2;
		
	}
	
	public MemberDTO(String id) {
		this.id= id;
	}
	
	
	
	public MemberDTO(String id, String name, String phone, String email) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	
	

	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public MemberDTO(String pw, String postal, String address1, String address2, String id) {
		this.id = id;
		this.pw = pw;
		this.postal = postal;
		this.address1 = address1;
		this.address2 = address2;
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostal() {
		return postal;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	

	
	
	
}
