package com.javalab.vo;

public class ReserveInfoVo {
	private String user_id;
	private String hotelName;
	private String roomName;
	private String checkin;
	private String checkout;
	private String numOfuser;
	private String diffDay;
	private String price;
	
	public ReserveInfoVo(String user_id, String hotelName, String roomName, String checkin, String checkout,
			String numOfuser, String diffDay, String price) {
		this.user_id = user_id;
		this.hotelName = hotelName;
		this.roomName = roomName;
		this.checkin = checkin;
		this.checkout = checkout;
		this.numOfuser = numOfuser;
		this.diffDay = diffDay;
		this.price = price;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
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

	public String getNumOfuser() {
		return numOfuser;
	}

	public void setNumOfuser(String numOfuser) {
		this.numOfuser = numOfuser;
	}

	public String getDiffDay() {
		return diffDay;
	}

	public void setDiffDay(String diffDay) {
		this.diffDay = diffDay;
	}
	
	

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ReserveInfoVo [user_id=" + user_id + ", hotelName=" + hotelName + ", roomName=" + roomName
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", numOfuser=" + numOfuser + ", diffDay="
				+ diffDay + "]";
	}
	

	
	
	
	
	
	
}
