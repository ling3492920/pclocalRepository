package cn.jhd.ec.entity.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import cn.jhd.ec.entity.admin.AdminAction;

public class AdminUser implements Serializable {
	private Integer user_id;
	private String user_name;//用户名
	private String email;//邮箱
	private String password;//密码
	private Integer add_time;//创建时间
	private Integer last_login;//最后一次登陆时间
	private String last_ip;//最后登陆ip地址
	private String action_list;//可操作模块集
	private String nav_list;//权限集
	private String lang_type;
	
	private Integer agency_id;
	private Integer suppliers_id;
	private String todolist;//记事本内容
	private Integer role_id;//外键-->关联角色表
	
	//用户关联的1级菜单
	private List<AdminUserAction> actions=new ArrayList<AdminUserAction>();//对应多个可操作菜单表
	
	
	private String perssions;//permissions 用户细分资源权限字段
	
	
	
	public String getPerssions() {
		return perssions;
	}
	public void setPerssions(String perssions) {
		this.perssions = perssions;
	}
	public List<AdminUserAction> getActions() {
		return actions;
	}
	public void setActions(List<AdminUserAction> actions) {
		this.actions = actions;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	public Integer getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Integer add_time) {
		this.add_time = add_time;
	}
	public Integer getLast_login() {
		return last_login;
	}
	public void setLast_login(Integer last_login) {
		this.last_login = last_login;
	}
	public String getLast_ip() {
		return last_ip;
	}
	public void setLast_ip(String last_ip) {
		this.last_ip = last_ip;
	}
	public String getAction_list() {
		return action_list;
	}
	public void setAction_list(String action_list) {
		this.action_list = action_list;
	}
	public String getNav_list() {
		return nav_list;
	}
	public void setNav_list(String nav_list) {
		this.nav_list = nav_list;
	}
	public String getLang_type() {
		return lang_type;
	}
	public void setLang_type(String lang_type) {
		this.lang_type = lang_type;
	}
	public Integer getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(Integer agency_id) {
		this.agency_id = agency_id;
	}
	public Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(Integer suppliers_id) {
		this.suppliers_id = suppliers_id;
	}
	public String getTodolist() {
		return todolist;
	}
	public void setTodolist(String todolist) {
		this.todolist = todolist;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	
}
