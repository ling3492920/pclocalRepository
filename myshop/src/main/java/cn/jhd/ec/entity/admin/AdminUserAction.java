package cn.jhd.ec.entity.admin;

import java.io.Serializable;
import java.util.List;

public class AdminUserAction implements Serializable {
	private Integer id;
	private Integer userid;
	private Integer action_id;
	private Integer parent_id;
	private String action_code;
	
	private String url;
	private String action_name;
	
	
	//关联的二级菜单
	private List<AdminUserAction> aus;
	
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAction_name() {
		return action_name;
	}

	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

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

	public List<AdminUserAction> getAus() {
		return aus;
	}

	public void setAus(List<AdminUserAction> aus) {
		this.aus = aus;
	}
	
}
