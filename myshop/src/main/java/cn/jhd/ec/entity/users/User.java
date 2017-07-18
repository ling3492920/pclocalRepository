package cn.jhd.ec.entity.users;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import cn.jhd.ec.entity.order.OrderInfo;

/**
 * 对应ecs_users表
 * @author Administrator
 *
 */
public class User implements Serializable{
	/**
	 * 当前版本
	 */
	private static final long serialVersionUID = 1L;
	
	private int user_id;//主键， 自增
	private String email;
	private String user_name;//用户名，唯一
	private String password;
	private Long reg_time;
	private Long last_login;
	
	private String last_ip;//非空 有默认值
	private int visit_count;//访问统计
	private String msn;//非空字段 无默认值
	private String qq;//非空字段 无默认值
	private String office_phone;//非空字段 无默认值
	private String home_phone;//非空字段 无默认值
	private String mobile_phone;//非空 无默认值
	private String passwd_question;
	private String passwd_answer;
	
	//
	private int credit_line;//非空字段 无默认值
	private String alias;//昵称 非空字段 无默认值
	
	//
	private Date birthday;
	private int sex;//默认0（保密）1（男）2（女）
	
	//
	private List<UserAddress> userAddres = new ArrayList<UserAddress>();
	
	private List<OrderInfo> orders = new ArrayList<OrderInfo>();
	
	
	
	public List<OrderInfo> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderInfo> orders) {
		this.orders = orders;
	}
	public List<UserAddress> getUserAddres() {
		return userAddres;
	}
	public void setUserAddres(List<UserAddress> userAddres) {
		this.userAddres = userAddres;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public Long getReg_time() {
		return reg_time;
	}
	public void setReg_time(Long reg_time) {
		this.reg_time = reg_time;
	}
	public Long getLast_login() {
		return last_login;
	}
	public void setLast_login(Long last_login) {
		this.last_login = last_login;
	}

	public String getLast_ip() {
		return last_ip;
	}
	public void setLast_ip(String last_ip) {
		this.last_ip = last_ip;
	}
	public int getVisit_count() {
		return visit_count;
	}
	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}
	public String getMsn() {
		return msn;
	}
	public void setMsn(String msn) {
		this.msn = msn;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getOffice_phone() {
		return office_phone;
	}
	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}
	public String getHome_phone() {
		return home_phone;
	}
	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}
	public String getMobile_phone() {
		return mobile_phone;
	}
	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}
	public String getPasswd_question() {
		return passwd_question;
	}
	public void setPasswd_question(String passwd_question) {
		this.passwd_question = passwd_question;
	}
	public String getPasswd_answer() {
		return passwd_answer;
	}
	public void setPasswd_answer(String passwd_answer) {
		this.passwd_answer = passwd_answer;
	}
	
	public int getCredit_line() {
		return credit_line;
	}
	public void setCredit_line(int credit_line) {
		this.credit_line = credit_line;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	
	
}
