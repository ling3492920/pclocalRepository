package cn.jhd.ec.entity.goods;

import java.io.Serializable;

public class Brand implements Serializable {
	private Integer brand_id;//主键
	private String brand_name;//品牌名称
	private String brand_logo;//品牌logo
	private String brand_desc;//品牌描述
	private String site_url;//品牌地址
	private Integer sort_order;//品牌排名//默认50
	private Integer is_show;//是否现实//默认1显示
	
	public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_logo() {
		return brand_logo;
	}
	public void setBrand_logo(String brand_logo) {
		this.brand_logo = brand_logo;
	}
	public String getBrand_desc() {
		return brand_desc;
	}
	public void setBrand_desc(String brand_desc) {
		this.brand_desc = brand_desc;
	}
	public String getSite_url() {
		return site_url;
	}
	public void setSite_url(String site_url) {
		this.site_url = site_url;
	}
	public Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(Integer sort_order) {
		this.sort_order = sort_order;
	}
	public Integer getIs_show() {
		return is_show;
	}
	public void setIs_show(Integer is_show) {
		this.is_show = is_show;
	}
	
	
}
