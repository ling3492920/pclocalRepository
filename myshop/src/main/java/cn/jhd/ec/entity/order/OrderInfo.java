package cn.jhd.ec.entity.order;

import java.io.Serializable;
/**
 * 订单信息表
 * @author Administrator
 *
 */
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import cn.jhd.ec.entity.relation.OrderGoods;
public class OrderInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer order_id;//主键
	/*常用字段*/
	private String order_sn;//	 order_sn 订单号 notnull no default
	private Integer order_status;//	 order_status 订单状态 
	private Integer pay_status;//	  pay_status 付款状态
	private Integer shipping_status;//	 shipping_status 配送状态
	private BigDecimal goods_amount;//	 goods_amount 商品总价
	private BigDecimal shipping_fee;//	 shipping_fee 运费
	private BigDecimal order_amount;//	 order_amount 费用总计
	
	private String consignee;//	 consignee 姓名
	private String address;//	 address 详细地址
	private String tel;//	 tel 电话
	private String sign_building;//	 sign_building 标志建筑
	private String email;//	 email 邮箱
	private String zipcode;//	 zipcode 邮编 
	private String mobile;//	 mobile 手机
	private String best_time;//	 best_time 最佳送货时间
	
	private Integer shipping_id;//	 shipping_id
	private String shipping_name;//	 shipping_name 快递公司名字 
	private Integer pay_id;//	 pay_id
	private String pay_name;//	 pay_name 对应支付方式名称
	private String how_oos;//	 how_oos 备注信息（等待所有商品备齐后再发）
	private Long add_time;//添加时间10位数以内//服务器生成
	/*常用字段*/
	
	/*关联商品*/
	private List<OrderGoods> ogs = new ArrayList<OrderGoods>();//从服务器session中取
	
	
	
	/*------------*/
	private Integer country;//国
	private Integer province;//省
	private Integer city;//市
	private Integer district;//区/镇
	/*------------*/
	
	private Integer user_id;//对应用户表主键，插入时把当前用户id传入，已标志该订单属于该用户
							 //可根据user_id做订单查询
	
	
	
	public Integer getOrder_id() {
		return order_id;
	}
	
	public Long getAdd_time() {
		return add_time;
	}

	public void setAdd_time(Long i) {
		this.add_time = i;
	}

	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getOrder_sn() {
		return order_sn;
	}
	public void setOrder_sn(String order_sn) {
		this.order_sn = order_sn;
	}
	public Integer getOrder_status() {
		return order_status;
	}
	public void setOrder_status(Integer order_status) {
		this.order_status = order_status;
	}
	public Integer getPay_status() {
		return pay_status;
	}
	public void setPay_status(Integer pay_status) {
		this.pay_status = pay_status;
	}
	public Integer getShipping_status() {
		return shipping_status;
	}
	public void setShipping_status(Integer shipping_status) {
		this.shipping_status = shipping_status;
	}
	public BigDecimal getGoods_amount() {
		return goods_amount;
	}
	public void setGoods_amount(BigDecimal goods_amount) {
		this.goods_amount = goods_amount;
	}
	public BigDecimal getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(BigDecimal shipping_fee) {
		this.shipping_fee = shipping_fee;
	}
	public BigDecimal getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(BigDecimal order_amount) {
		this.order_amount = order_amount;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSign_building() {
		return sign_building;
	}
	public void setSign_building(String sign_building) {
		this.sign_building = sign_building;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBest_time() {
		return best_time;
	}
	public void setBest_time(String best_time) {
		this.best_time = best_time;
	}
	public Integer getShipping_id() {
		return shipping_id;
	}
	public void setShipping_id(Integer shipping_id) {
		this.shipping_id = shipping_id;
	}
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public Integer getPay_id() {
		return pay_id;
	}
	public void setPay_id(Integer pay_id) {
		this.pay_id = pay_id;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public String getHow_oos() {
		return how_oos;
	}
	public void setHow_oos(String how_oos) {
		this.how_oos = how_oos;
	}
	public List<OrderGoods> getOgs() {
		return ogs;
	}
	public void setOgs(List<OrderGoods> ogs) {
		this.ogs = ogs;
	}
	public Integer getCountry() {
		return country;
	}
	public void setCountry(Integer country) {
		this.country = country;
	}
	public Integer getProvince() {
		return province;
	}
	public void setProvince(Integer province) {
		this.province = province;
	}
	public Integer getCity() {
		return city;
	}
	public void setCity(Integer city) {
		this.city = city;
	}
	public Integer getDistrict() {
		return district;
	}
	public void setDistrict(Integer district) {
		this.district = district;
	}
	
	
	
	
	
}
