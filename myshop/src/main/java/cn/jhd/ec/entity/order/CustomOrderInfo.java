package cn.jhd.ec.entity.order;

public class CustomOrderInfo extends OrderInfo {
	private Integer startLine;
	private Integer pageSize;
	private Integer[] ship_statu;
	private String orderbycolum;//排序字段"'index' asc,id asc"查询结果按index字段排序，结果想同按id排
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
	public Integer[] getShip_statu() {
		return ship_statu;
	}
	public void setShip_statu(Integer[] ship_statu) {
		this.ship_statu = ship_statu;
	}
	public String getOrderbycolum() {
		return orderbycolum;
	}
	public void setOrderbycolum(String orderbycolum) {
		this.orderbycolum = orderbycolum;
	}
	
	
}
