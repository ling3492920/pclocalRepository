package cn.jhd.ec.entity.admin;

import java.io.Serializable;
/**
 * 角色信息表
 * @author Administrator
 *
 */
public class AdminRole implements Serializable {
	private Integer role_id;//角色id
	private String role_name;//角色名称
	private String action_list;//角色权限
	private String role_describe;//角色描述
	private String permissions;
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getAction_list() {
		return action_list;
	}
	public void setAction_list(String action_list) {
		this.action_list = action_list;
	}
	public String getRole_describe() {
		return role_describe;
	}
	public void setRole_describe(String role_describe) {
		this.role_describe = role_describe;
	}
	public String getPermissions() {
		return permissions;
	}
	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}
	
	
}	
