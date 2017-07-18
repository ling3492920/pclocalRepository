package cn.jhd.ec.entity.relation;

import java.io.Serializable;
/**
 * 
 * @author Administrator
 * 订单与商品关联中间表
 */
import java.math.BigDecimal;
public class OrderGoods implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rec_id; //主键
	private int order_id;//外键
	private int goods_id;//外键
	private String goods_name;//商品名称
	private String goods_sn;//商品编号
	private int goods_number;//商品数量
	private BigDecimal market_price;//推荐售价
	private BigDecimal goods_price;//本店售价
	private String goods_attr;// notnull no default 商品属性
	private int send_number;
	private int is_real;
	private String extension_code;
	private int parent_id;
	private int is_gift;
	private String goods_attr_id;
	
	public int getRec_id() {
		return rec_id;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_sn() {
		return goods_sn;
	}
	public void setGoods_sn(String goods_sn) {
		this.goods_sn = goods_sn;
	}
	public int getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(int goods_number) {
		this.goods_number = goods_number;
	}
	public BigDecimal getMarket_price() {
		return market_price;
	}
	public void setMarket_price(BigDecimal market_price) {
		this.market_price = market_price;
	}
	public BigDecimal getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(BigDecimal goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_attr() {
		return goods_attr;
	}
	public void setGoods_attr(String goods_attr) {
		this.goods_attr = goods_attr;
	}
	public int getSend_number() {
		return send_number;
	}
	public void setSend_number(int send_number) {
		this.send_number = send_number;
	}
	public int getIs_real() {
		return is_real;
	}
	public void setIs_real(int is_real) {
		this.is_real = is_real;
	}
	public String getExtension_code() {
		return extension_code;
	}
	public void setExtension_code(String extension_code) {
		this.extension_code = extension_code;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getIs_gift() {
		return is_gift;
	}
	public void setIs_gift(int is_gift) {
		this.is_gift = is_gift;
	}
	public String getGoods_attr_id() {
		return goods_attr_id;
	}
	public void setGoods_attr_id(String goods_attr_id) {
		this.goods_attr_id = goods_attr_id;
	}
	
	
}
