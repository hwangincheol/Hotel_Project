package com.javalab.vo;


public class ReserveVo {
	private String reserve_no;
	private String user_id;
	private String hotel_id;
	private String room_id;
	private String reserve_name; // 예약 고객 이름
	private String reserve_phone; // 예약 고객 전화번호
	private String reserve_email; // 예약 고객 이메일
	private String checkin;
	private String checkout;
	private int num_of_user;
	
	public ReserveVo(String reserve_no, String user_id, String hotel_id, String room_id, String reserve_name,
			String reserve_phone, String reserve_email, String checkin, String checkout, int num_of_user) {
		this.reserve_no = reserve_no;
		this.user_id = user_id;
		this.hotel_id = hotel_id;
		this.room_id = room_id;
		this.reserve_name = reserve_name;
		this.reserve_phone = reserve_phone;
		this.reserve_email = reserve_email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.num_of_user = num_of_user;
	}

	public ReserveVo(String user_id, String hotel_id, String room_id, String reserve_name, String reserve_phone,
			String reserve_email, String checkin, String checkout, int num_of_user) {
		this.user_id = user_id;
		this.hotel_id = hotel_id;
		this.room_id = room_id;
		this.reserve_name = reserve_name;
		this.reserve_phone = reserve_phone;
		this.reserve_email = reserve_email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.num_of_user = num_of_user;
	}

	public String getReserve_no() {
		return reserve_no;
	}

	public void setReserve_no(String reserve_no) {
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

	public int getNum_of_user() {
		return num_of_user;
	}

	public void setNum_of_user(int num_of_user) {
		this.num_of_user = num_of_user;
	}

	@Override
	public String toString() {
		return "ReserveVo [reserve_no=" + reserve_no + ", user_id=" + user_id + ", hotel_id=" + hotel_id + ", room_id="
				+ room_id + ", reserve_name=" + reserve_name + ", reserve_phone=" + reserve_phone + ", reserve_email="
				+ reserve_email + ", checkin=" + checkin + ", checkout=" + checkout + ", num_of_user=" + num_of_user
				+ "]";
	}

	
	
	
	
	
	
}
