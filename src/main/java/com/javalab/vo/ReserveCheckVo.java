package com.javalab.vo;

import java.sql.Date;

public class ReserveCheckVo {
	
	
	private int reserve_no;
	private String user_id;
	private String hotel_id;
	private String room_id;
	private String reserve_name;
	private String reserve_phone;
	private String reserve_email;
	private String checkin;
	private String checkout;
	
	//NUMBER_OF_USER 추가해야함
	
	//편의를 위해서 생성
	private String room_type;
	
	public ReserveCheckVo() {
		super();
	}

	public ReserveCheckVo(int reserve_no, String user_id, String hotel_id, String room_id, String reserve_name,
			String reserve_phone, String reserve_email, String checkin, String checkout, String room_type) {
		super();
		this.reserve_no = reserve_no;
		this.user_id = user_id;
		this.hotel_id = hotel_id;
		this.room_id = room_id;
		this.reserve_name = reserve_name;
		this.reserve_phone = reserve_phone;
		this.reserve_email = reserve_email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.room_type = room_type;
	}

	public int getReserve_no() {
		return reserve_no;
	}

	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getHotel_id() {
		return hotel_id;
	}

	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getReserve_name() {
		return reserve_name;
	}

	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}

	public String getReserve_phone() {
		return reserve_phone;
	}

	public void setReserve_phone(String reserve_phone) {
		this.reserve_phone = reserve_phone;
	}

	public String getReserve_email() {
		return reserve_email;
	}

	public void setReserve_email(String reserve_email) {
		this.reserve_email = reserve_email;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	
	

}
