package cn.jhd.ec.entity.goods;

import java.io.Serializable;
import java.math.BigDecimal;

public class Good implements Serializable {
	/*索引字段*/
	private Integer goods_id;//	主键：goods_id
	private Integer cat_id;//	外键：cat_id（对应商品类型）
	private Integer brand_id;//	外键：brand_id(对应手机品牌id）
	private String goods_sn;//	goods_sn:商品货号
	private Integer goods_number;//	goods_number:库存数量
	private BigDecimal goods_weight;//	goods_weight:商品重量
	private Integer promote_start_date;//	promote_start_date:促销开始日期
	private Integer promote_end_date;//	promote_end_date:促销结束日期
	private Integer sort_order;//	sort_order:排序
	private Integer last_update;//	last_update:最后一次更改时间
		
		/*常用字段*/
	private String goods_name;//	goods_name:商品名称
	private String goods_name_style;//	goods_name_style:商品名称字体样式
	private Integer click_count;//	click_count:点击次数
	private BigDecimal market_price;//	market_price:市场价
	private BigDecimal shop_price;//	shop_price:本店售价 
	private BigDecimal promote_price;//	promote_price:c促销价
	private Integer warn_number;//	warn_number:库存警告数量
	private String keywords;//	keywords:商品关键词
	private String goods_brief;//	goods_brief:商品简单描述
	private String goods_desc;//	goods_desc:商品描述
	private String goods_thumb;//	goods_thumb:商品缩略图路径
	private String goods_img;//	goods_img:商品预览图路径
	private String original_img;//	original_img:原图路径
	
	
	private Integer is_on_sale;//	is_on_sale:是否上架
	private Integer is_alone_sale;//	is_alone_sale:是否单品
	private Integer integral;//	integral:积分购买金额
	private Integer add_time;//	add_time:上架时间
	private Integer is_delete;//	is_delete:是否删除
	private Integer is_best;//	is_best:是否精品
	private Integer is_new;//	is_new:是否新品
	private Integer is_hot;//	is_hot:是否热销
	private Integer is_promote;//	is_promote:是否促销
	private Integer goods_type;//	goods_type:商品类型
	private String seller_note;//	seller_note:商家备注
	private Integer is_shipping;//是否免运费
	private Brand brand;//商品关联品牌
	
	private Integer type;
	private Integer suppliers_id;//供货商ID
	
	
	
	public Integer getSuppliers_id() {
		return suppliers_id;
	}
	public void setSuppliers_id(Integer suppliers_id) {
		this.suppliers_id = suppliers_id;
	}
	public Integer getIs_shipping() {
		return is_shipping;
	}
	public void setIs_shipping(Integer is_shipping) {
		this.is_shipping = is_shipping;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
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
	public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(String goods_sn) {
		this.goods_sn = goods_sn;
	}

	public Integer getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(Integer goods_number) {
		this.goods_number = goods_number;
	}
	public BigDecimal getGoods_weight() {
		return goods_weight;
	}
	public void setGoods_weight(BigDecimal goods_weight) {
		this.goods_weight = goods_weight;
	}
	public Integer getPromote_start_date() {
		return promote_start_date;
	}
	public void setPromote_start_date(Integer promote_start_date) {
		this.promote_start_date = promote_start_date;
	}
	public Integer getPromote_end_date() {
		return promote_end_date;
	}
	public void setPromote_end_date(Integer promote_end_date) {
		this.promote_end_date = promote_end_date;
	}
	public Integer getSort_order() {
		return sort_order;
	}
	public void setSort_order(Integer sort_order) {
		this.sort_order = sort_order;
	}
	public Integer getLast_update() {
		return last_update;
	}
	public void setLast_update(Integer last_update) {
		this.last_update = last_update;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_name_style() {
		return goods_name_style;
	}
	public void setGoods_name_style(String goods_name_style) {
		this.goods_name_style = goods_name_style;
	}
	public Integer getClick_count() {
		return click_count;
	}
	public void setClick_count(Integer click_count) {
		this.click_count = click_count;
	}
	public BigDecimal getMarket_price() {
		return market_price;
	}
	public void setMarket_price(BigDecimal market_price) {
		this.market_price = market_price;
	}
	public BigDecimal getShop_price() {
		return shop_price;
	}
	public void setShop_price(BigDecimal shop_price) {
		this.shop_price = shop_price;
	}
	public BigDecimal getPromote_price() {
		return promote_price;
	}
	public void setPromote_price(BigDecimal promote_price) {
		this.promote_price = promote_price;
	}
	public Integer getWarn_number() {
		return warn_number;
	}
	public void setWarn_number(Integer warn_number) {
		this.warn_number = warn_number;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getGoods_brief() {
		return goods_brief;
	}
	public void setGoods_brief(String goods_brief) {
		this.goods_brief = goods_brief;
	}
	public String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}
	public String getGoods_thumb() {
		return goods_thumb;
	}
	public void setGoods_thumb(String goods_thumb) {
		this.goods_thumb = goods_thumb;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public String getOriginal_img() {
		return original_img;
	}
	public void setOriginal_img(String original_img) {
		this.original_img = original_img;
	}
	public Integer getIs_on_sale() {
		return is_on_sale;
	}
	public void setIs_on_sale(Integer is_on_sale) {
		this.is_on_sale = is_on_sale;
	}
	public Integer getIs_alone_sale() {
		return is_alone_sale;
	}
	public void setIs_alone_sale(Integer is_alone_sale) {
		this.is_alone_sale = is_alone_sale;
	}
	public Integer getIntegral() {
		return integral;
	}
	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	public Integer getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Integer add_time) {
		this.add_time = add_time;
	}
	public Integer getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}
	public Integer getIs_best() {
		return is_best;
	}
	public void setIs_best(Integer is_best) {
		this.is_best = is_best;
	}
	public Integer getIs_new() {
		return is_new;
	}
	public void setIs_new(Integer is_new) {
		this.is_new = is_new;
	}
	public Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(Integer is_hot) {
		this.is_hot = is_hot;
	}
	public Integer getIs_promote() {
		return is_promote;
	}
	public void setIs_promote(Integer is_promote) {
		this.is_promote = is_promote;
	}
	public Integer getGoods_type() {
		return goods_type;
	}
	public void setGoods_type(Integer goods_type) {
		this.goods_type = goods_type;
	}
	public String getSeller_note() {
		return seller_note;
	}
	public void setSeller_note(String seller_note) {
		this.seller_note = seller_note;
	}
	
	/*意义不明字段*/
//private String //	provider_name
//private Integer //	is_real:
//private String //	extension_code
//private Integer //	is_shipping
//private Integer //	bonus_type_id:
//private Integer //	give_integral
//private Integer //	rank_integral:
//private Integer //	suppliers_id
//private Integer //	is_check
	
	
}
