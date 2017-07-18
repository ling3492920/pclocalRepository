package cn.jhd.ec.entity.goods;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 * 商品关联类型类
 * @author Administrator
 *
 */
public class Category implements Serializable {
	private Integer cat_id;//主键
	private String cat_name;//类型名称
	private String keywords;//关键字
	private String cat_desc;//类型描述
	private Integer parent_id;//关联主键cat_id，对应父级分类id顶级父级id为0
	private Integer sort_order;//排序级别
	private String template_file;
	private String measure_unit;//单位‘台’‘本’等等
	private Integer show_in_nav;//是否显示到导航栏
	private String style;//样式
	private Integer is_show;//是否显示
	private Integer grade;//价格区间0~10
	private String filter_attr;//属性字段集合字符串每一个数用‘,’号分隔。
	//代表一个属性可关联到属性表
	
	private List<Category> cats = new ArrayList<Category>();
	
	private List<Good> goods = new ArrayList<Good>();
	
	
	
	public List<Good> getGoods() {
		return goods;
	}
	public void setGoods(List<Good> goods) {
		this.goods = goods;
	}
	public List<Category> getCats() {
		return cats;
	}
	public void setCats(List<Category> cats) {
		this.cats = cats;
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
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getCat_desc() {
		return cat_desc;
	}
	public void setCat_desc(String cat_desc) {
		this.cat_desc = cat_desc;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(Integer sort_order) {
		this.sort_order = sort_order;
	}
	public String getTemplate_file() {
		return template_file;
	}
	public void setTemplate_file(String template_file) {
		this.template_file = template_file;
	}
	public String getMeasure_unit() {
		return measure_unit;
	}
	public void setMeasure_unit(String measure_unit) {
		this.measure_unit = measure_unit;
	}
	public Integer getShow_in_nav() {
		return show_in_nav;
	}
	public void setShow_in_nav(Integer show_in_nav) {
		this.show_in_nav = show_in_nav;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public Integer getIs_show() {
		return is_show;
	}
	public void setIs_show(Integer is_show) {
		this.is_show = is_show;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getFilter_attr() {
		return filter_attr;
	}
	public void setFilter_attr(String filter_attr) {
		this.filter_attr = filter_attr;
	}
	
	
}
