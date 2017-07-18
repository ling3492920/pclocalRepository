package cn.jhd.ec.entity.goods;

public class GoodForCart extends Good {
	private Integer num;//购买数量
	private Double goods_amount;//小计
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Double getGoods_amount() {
		return goods_amount;
	}
	public void setGoods_amount(Double goods_amount) {
		this.goods_amount = goods_amount;
	}
	
	
}
