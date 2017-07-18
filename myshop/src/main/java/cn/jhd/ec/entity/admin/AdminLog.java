package cn.jhd.ec.entity.admin;

import java.io.Serializable;

public class AdminLog implements Serializable{
	private Integer log_id;
	private Integer log_time;//10位数
	private Integer user_id;//3位数
	private String log_info;
	private String ip_address;
	public Integer getLog_id() {
		return log_id;
	}
	public void setLog_id(Integer log_id) {
		this.log_id = log_id;
	}
	public Integer getLog_time() {
		return log_time;
	}
	public void setLog_time(Integer log_time) {
		this.log_time = log_time;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getLog_info() {
		return log_info;
	}
	public void setLog_info(String log_info) {
		this.log_info = log_info;
	}
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	
}
