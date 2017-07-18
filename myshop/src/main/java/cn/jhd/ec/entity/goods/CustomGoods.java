package cn.jhd.ec.entity.goods;

public class CustomGoods extends Good{
	private Integer startLine;
	private Integer pageSize;
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
	
}
