package cn.jhd.ec.entity.relation;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.goods.GoodsType;

public class GoodsCat implements Serializable {
	private Integer goods_id;
	private Integer cat_id;
	List<Good> gs = new ArrayList<Good>();
	List<GoodsType> gst = new ArrayList<GoodsType>();
	
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(Integer cat_id) {
		this.cat_id = cat_id;
	}
	public List<Good> getGs() {
		return gs;
	}
	public void setGs(List<Good> gs) {
		this.gs = gs;
	}
	public List<GoodsType> getGst() {
		return gst;
	}
	public void setGst(List<GoodsType> gst) {
		this.gst = gst;
	}
	
	
}
