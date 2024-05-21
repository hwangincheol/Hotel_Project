package com.javalab.vo;

public class MemberVo {

	private String user_id;
	private String password;
	private String name;
	private String phone;
	private String email;
	
	public MemberVo(String user_id, String password, String name, String phone, String email) {
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	
	
	public MemberVo(String user_id, String password) {
		this.user_id = user_id;
		this.password = password;
	}

	

	public MemberVo(String user_id, String name, String phone, String email) {
		this.user_id = user_id;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}


	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "MemberVo [user_id=" + user_id + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", email=" + email + "]";
	}
	
	
	
}
