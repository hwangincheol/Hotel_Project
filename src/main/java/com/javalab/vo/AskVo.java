package com.javalab.vo;

public class AskVo {
	
	private int ask_no;
	private String ask_name;
	private String ask_title;
	private String ask_content;
	private String ask_phone;
	private String ask_email;
	private String ask_date;
	
	public AskVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AskVo(int ask_no, String ask_name, String ask_title, String ask_content, String ask_phone, String ask_email,
			String ask_date) {
		super();
		this.ask_no = ask_no;
		this.ask_name = ask_name;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
		this.ask_phone = ask_phone;
		this.ask_email = ask_email;
		this.ask_date = ask_date;
	}
	
	public AskVo(String ask_name, String ask_title, String ask_content, String ask_phone, String ask_email,
			String ask_date) {
		super();
		this.ask_name = ask_name;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
		this.ask_phone = ask_phone;
		this.ask_email = ask_email;
		this.ask_date = ask_date;
	}
	
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public String getAsk_name() {
		return ask_name;
	}
	public void setAsk_name(String ask_name) {
		this.ask_name = ask_name;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_phone() {
		return ask_phone;
	}
	public void setAsk_phone(String ask_phone) {
		this.ask_phone = ask_phone;
	}
	public String getAsk_email() {
		return ask_email;
	}
	public void setAsk_email(String ask_email) {
		this.ask_email = ask_email;
	}
	public String getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}

	
	
}
