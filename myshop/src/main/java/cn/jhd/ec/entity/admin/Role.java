package cn.jhd.ec.entity.admin;

import java.io.Serializable;
/**
 * 对应角色表
 * @author Administrator
 *
 */
public class Role implements Serializable {
	private Integer role_id;
	private String role_name;//角色名称
	private String action_list;//可操作集
	private String role_describe;//角色描述
	
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
	
}
