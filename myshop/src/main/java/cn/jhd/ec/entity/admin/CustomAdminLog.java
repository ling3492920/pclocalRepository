package cn.jhd.ec.entity.admin;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomAdminLog extends AdminLog {
	private Integer startLine;
	private Integer pageSize;
	private String user_name;
	private String dateTime;
	public Integer getStartLine() {
		return startLine;
	}
	public void setStartLine(Integer startLine) {
		this.startLine = startLine;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDateTime() {
		setDateTime();
		return dateTime;
	}
	public void setDateTime() {
		Date d = new Date(Long.valueOf(super.getLog_time()+"000"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		this.dateTime = sdf.format(d);
	}
	
	
	
	
}
