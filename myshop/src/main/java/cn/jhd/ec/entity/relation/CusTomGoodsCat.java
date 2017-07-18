package cn.jhd.ec.entity.relation;

import java.io.Serializable;

import cn.jhd.ec.entity.goods.Good;
/**
 * 自定义的商品关联商品类型表
 * @author Administrator
 *
 */
public class CusTomGoodsCat extends Good implements Serializable {
	private Integer cat_id;//5位
	private String cat_name;//60位
	private Integer enabled;//1位
	private String attr_group;//255位
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
