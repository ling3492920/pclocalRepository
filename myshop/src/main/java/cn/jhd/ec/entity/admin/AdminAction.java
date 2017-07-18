package cn.jhd.ec.entity.admin;

import java.io.Serializable;

public class AdminAction implements Serializable {
	private Integer action_id;//主键
	private Integer parent_id;//关联父主键
	private String action_code;//对应操作代码
	public Integer getAction_id() {
		return action_id;
	}
	public void setAction_id(Integer action_id) {
		this.action_id = action_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getAction_code() {
		return action_code;
	}
	public void setAction_code(String action_code) {
		this.action_code = action_code;
	}
	
}
