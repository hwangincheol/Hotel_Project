package com.javalab.vo;

public class HotelVo {
	private String hotel_id;
	private String hotel_name;
	private String hotel_phone;
	
	public HotelVo(String hotel_id, String hotel_name, String hotel_phone) {
		this.hotel_id = hotel_id;
		this.hotel_name = hotel_name;
		this.hotel_phone = hotel_phone;
	}

	public String getHotel_id() {
		return hotel_id;
	}

	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}

	public String getHotel_name() {
		return hotel_name;
	}

	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

	public String getHotel_phone() {
		return hotel_phone;
	}

	public void setHotel_phone(String hotel_phone) {
		this.hotel_phone = hotel_phone;
	}

	@Override
	public String toString() {
		return "HotelVo [hotel_id=" + hotel_id + ", hotel_name=" + hotel_name + ", hotel_phone=" + hotel_phone + "]";
	}
	
	
	
	
}
