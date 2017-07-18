package cn.jhd.ec.client.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.goods.GoodDao;
import cn.jhd.ec.entity.goods.GoodForCart;
import cn.jhd.ec.entity.goods.GoodsAboutBrand;
import cn.jhd.ec.entity.goods.ShopingCart;
import cn.jhd.ec.util.JsonResult;
@Service
public class ShopCartServiceImpl implements ShopCartService {
	@Resource
	private GoodDao gd;
	
	private ShopingCart sc = new ShopingCart();
	public JsonResult save(Integer goods_id,Integer num,Double goods_amount) {
		GoodForCart gfc1 = (GoodForCart)gd.findById(goods_id);
		
		if(gfc1!=null){
			gfc1.setNum(num);
			gfc1.setGoods_amount(goods_amount);
			List<GoodForCart> gfcs=sc.getGoods();
			for (GoodForCart gfc : gfcs) {
				if(gfc.getGoods_id()==goods_id){//如果已经添加过，就再累加
					gfc.setNum(gfc.getNum()+num);
				}
			}
			
			return new JsonResult(sc);
		}
		return new JsonResult(1);
	}

	public JsonResult find() {
		
		return null;
	}

	public JsonResult delByGoodsId(Integer goods_id) {
		
		return null;
	}

}
