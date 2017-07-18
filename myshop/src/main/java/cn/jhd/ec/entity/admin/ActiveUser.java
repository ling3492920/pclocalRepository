package cn.jhd.ec.entity.admin;

import java.util.List;

public class ActiveUser {
	private Integer userId;
	private String userName;
	private String userCode;
	
	private List<AdminUserAction> menus;
	
	
	public List<AdminUserAction> getMenus() {
		return menus;
	}
	public void setMenus(List<AdminUserAction> menus2) {
		this.menus = menus2;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	
}
