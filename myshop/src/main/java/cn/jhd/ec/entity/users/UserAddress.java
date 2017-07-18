package cn.jhd.ec.entity.users;

import java.io.Serializable;

public class UserAddress implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int address_id;//	主键：address_id
	private int user_id;//	外键：user_id
	private String consignee;//	consignee:收货人姓名
	private String email;//	email：邮箱
	private int country;//	country：国
	private int province;//	province：省
	private int city;//	city：市
	private int district;//	district:区
	private String address;//	address：详细地址
	private String zipcode;//	zipcode：邮编
	private String tel;//	tel：电话
	private String mobile;//	mobile：手机
	private String best_time;//	best_time：最佳送货时间
	private String sign_building;//	sign_building：标志性建筑
	private String address_name;//	address_name
	
	
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCountry() {
		return country;
	}
	public void setCountry(int country) {
		this.country = country;
	}
	public int getProvince() {
		return province;
	}
	public void setProvince(int province) {
		this.province = province;
	}
	public int getCity() {
		return city;
	}
	public void setCity(int city) {
		this.city = city;
	}
	public int getDistrict() {
		return district;
	}
	public void setDistrict(int district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBest_time() {
		return best_time;
	}
	public void setBest_time(String best_time) {
		this.best_time = best_time;
	}
	public String getSign_building() {
		return sign_building;
	}
	public void setSign_building(String sign_building) {
		this.sign_building = sign_building;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	
	
}
