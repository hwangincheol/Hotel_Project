package com.javalab.vo;

public class RoomVo {
	
	private String room_id;
	private String room_name;
	private String room_type;
	private int room_capacity;
	private String room_price;
	/**
	 * @param room_id
	 * @param room_name
	 * @param room_type
	 * @param room_capacity
	 * @param room_price
	 */
	public RoomVo(String room_id, String room_name, String room_type, int room_capacity, String room_price) {
		super();
		this.room_id = room_id;
		this.room_name = room_name;
		this.room_type = room_type;
		this.room_capacity = room_capacity;
		this.room_price = room_price;
	}

	
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getRoom_capacity() {
		return room_capacity;
	}
	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}
	
	@Override
	public String toString() {
		return "RoomVo [room_id=" + room_id + ", room_name=" + room_name + ", room_type=" + room_type
				+ ", room_capacity=" + room_capacity + ", room_price=" + room_price + "]";
	}
	
	
}
