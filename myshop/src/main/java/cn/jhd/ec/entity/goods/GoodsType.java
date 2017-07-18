package cn.jhd.ec.entity.goods;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.jhd.ec.entity.relation.GoodsCat;
/**
 * 其实是与类型无多大关系的类
 * @author Administrator
 *
 */
public class GoodsType implements Serializable {
	
	
	private Integer cat_id;//5位
	private String cat_name;//60位
	private Integer enabled;//1位
	private String attr_group;//255位
	
	public List<GoodsCat> gcs = new ArrayList<GoodsCat>();
	
	public List<Good> gs = new ArrayList<Good>();
	
	
	
	public List<Good> getGs() {
		return gs;
	}
	public void setGs(List<Good> gs) {
		this.gs = gs;
	}
	public List<GoodsCat> getGcs() {
		return gcs;
	}
	public void setGcs(List<GoodsCat> gcs) {
		this.gcs = gcs;
	}
	public Integer getCat_id() {
		return cat_id;
	}
	public void setCat_id(Integer cat_id) {
		this.cat_id = cat_id;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public String getAttr_group() {
		return attr_group;
	}
	public void setAttr_group(String attr_group) {
		this.attr_group = attr_group;
	}
	
	
}
