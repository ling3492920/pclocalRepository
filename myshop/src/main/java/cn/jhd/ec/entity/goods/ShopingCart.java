package cn.jhd.ec.entity.goods;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
/**
 * 购物车对应实体类
 * @author Administrator
 *
 */
public class ShopingCart implements Serializable {
	private List<GoodForCart> goods = new ArrayList<GoodForCart>();

	public List<GoodForCart> getGoods() {
		return goods;
	}

	public void setGoods(List<GoodForCart> goods) {
		this.goods = goods;
	}
	
}
