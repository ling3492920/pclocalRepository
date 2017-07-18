package cn.jhd.ec.client.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jhd.ec.client.service.GoodsService;
import cn.jhd.ec.client.service.OrderInfoService;
import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.util.JsonResult;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Resource
	private GoodsService gs;
	
	@Resource
	private OrderInfoService ois;
	
	/**
	 * 这个方法将集中处理区块，类型商品加载请求
	 * @param rec_type
	 * @param cid
	 * @return
	 */
	@RequestMapping("/findcat.do")
	@ResponseBody
	public JsonResult findaddCat(Integer rec_type,Integer cid){
		System.out.println(rec_type+":"+cid);
		CustomGood customgood = new CustomGood();
		if(rec_type==1){

			customgood.setIs_best(1);
			customgood.setCat_id(cid);
			
			customgood.setPage(1);
			customgood.setType(1);
			return gs.findAuto(customgood);
		}else if(rec_type==2){

			customgood.setIs_new(1);
			customgood.setCat_id(cid);
			
			customgood.setPage(1);
			customgood.setType(2);
			return gs.findAuto(customgood);
		}else{
			customgood.setIs_hot(1);
			customgood.setCat_id(cid);
			
			customgood.setPage(1);
			customgood.setType(3);
			return gs.findAuto(customgood);
		}
		
	}
	
	//查询单个商品
	@RequestMapping("/findById.do")
	@ResponseBody
	public JsonResult findById(Integer goods_id){
		
		return gs.findByIdAboutBrand(goods_id);
	}
	
	//真自定义查询条件
	@RequestMapping("/autoSelect.do")
	@ResponseBody
	public JsonResult autoSelect(CustomGood customgood){
		return gs.findAuto(customgood);
	}
	
	//说明：虽然自定义查询可以完成使用商品表中任何字段条件的查询，但是为了防止请求数据量过大
	//对每次请求数据做个性化设置
	//1.特价区查询(是否促销）
	@RequestMapping("/promote.do")
	@ResponseBody
	public JsonResult findByIs_promote(){
		Integer is_promote=1;//说明是处于促销状态
		CustomGood customgood = new CustomGood();
		customgood.setIs_promote(is_promote);
		customgood.setPage(1);
		return gs.findAuto(customgood);
	}
	//2.精品推荐区查询
	@RequestMapping("/best.do")
	@ResponseBody
	public JsonResult findByIs_best(){
		Integer is_best=1;//说明是精品商品
		CustomGood customgood = new CustomGood();
		customgood.setIs_best(is_best);
		customgood.setPage(1);
		return gs.findAuto(customgood);
	}
	
	//3.精品与具体商品类型结合查询
	@RequestMapping("/bestAndCat.do")
	@ResponseBody
	public JsonResult findByBestAndCat(Integer cat_id){
		System.out.println(cat_id);
		Integer is_best=1;
		CustomGood customgood = new CustomGood();
		customgood.setIs_best(is_best);
		customgood.setCat_id(cat_id);
		customgood.setPage(1);
		return gs.findAuto(customgood);
	}
	//4.是否新品上市查询
	@RequestMapping("/new.do")
	@ResponseBody
	public JsonResult findByIsOnSale(){
		//说明是已上市新品
		CustomGood customgood = new CustomGood();
		customgood.setIs_new(1);
		customgood.setPage(1);//默认查第一页
		return gs.findAuto(customgood);
	}
	//5.是否新品上市与商品类型综合查询
	@RequestMapping("/newAndCat.do")
	@ResponseBody
	public JsonResult findByNewAndCat(Integer cat_id){
		Integer is_new=1;//说明是已上市新品
		CustomGood customgood = new CustomGood();
		customgood.setIs_new(is_new);
		customgood.setCat_id(cat_id);
		customgood.setPage(1);
		return gs.findAuto(customgood);
	}
	//6.是否热卖
	@RequestMapping("/hot.do")
	@ResponseBody
	public JsonResult findByIsHot(){
		Integer is_hot=1;//说明是热销产品
		CustomGood customgood = new CustomGood();
		customgood.setIs_hot(is_hot);
		customgood.setPage(1);
		return gs.findAuto(customgood);
	}
	
	//7.是否热卖与商品类型结合查询
	@RequestMapping("/hotAndCat.do")
	@ResponseBody
	public JsonResult findByHotAndCat(Integer cat_id){
		Integer is_hot=1;//说明是热销产品
		CustomGood customgood = new CustomGood();
		customgood.setIs_hot(is_hot);
		customgood.setCat_id(cat_id);
		customgood.setPage(1);
		return gs.findAuto(customgood);
	}
	
	//8.按成交量查询并排序 4表示成交的订单状态，
	//真实业务中，还应该加上时间段这种过滤条件，已获取某一段时间的成就量排行
	//----所以该方法默认查询历史所有成交商品销量排行
	@RequestMapping("/sales.do")
	@ResponseBody
	public JsonResult findSales(){
		return ois.findByStatus(4);
	}
}
