package cn.jhd.ec.entity.goods;

import java.io.Serializable;

public class CustomGood extends Good implements Serializable{
	//第1页,默认从0开始
	private Integer startPos;//开始的条目
	private Integer pageSize;//每页显示的条数
	private Integer page;//页数
	//1页，0 ，10 //2页，10,10//3页，20,10
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStartPos() {
		return startPos;
	}
	public void setStartPos() {
		startPos = (page-1)*pageSize;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
