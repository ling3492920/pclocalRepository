package cn.jhd.ec.client.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jhd.ec.dao.goods.GoodDao;
import cn.jhd.ec.entity.goods.CustomGood;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.entity.goods.GoodsAboutBrand;
import cn.jhd.ec.util.JsonResult;
@Service
public class GoodsServiceImpl implements GoodsService {
	@Resource
	private GoodDao goodDao;
	
	public JsonResult<List<Good>> findAuto(CustomGood customgood) {
		Properties pro = new Properties();
		try {
			InputStream is = GoodsServiceImpl.class.getClassLoader().getResourceAsStream("pageSize.properties");
//			pro.load(new FileInputStream(new File("pageSize.properties")));
			pro.load(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int pageSize = Integer.parseInt(pro.getProperty("pageSize"));
		System.out.println(pageSize);
		if(customgood.getPage()==null){
			return new JsonResult<List<Good>>(0);//加载更多失败
		}
		customgood.setPageSize(pageSize);
		customgood.setStartPos();
		List<Good> goods = goodDao.findAuto(customgood);
		if(goods!=null){
			for (Good good : goods) {
				good.setType(customgood.getType());
			}
			return new JsonResult<List<Good>>(goods);
		}
		return new JsonResult<List<Good>>(2,"没有更多商品可以显示了！",null);//没有更多了
	}
	
	
	public JsonResult<Good> findById(Integer goods_id) {
		Good goods =goodDao.findById(goods_id);
		if(goods!=null){
			return new JsonResult<Good>(goods);
		}
		return new JsonResult<Good>(1);
	}
	
	
	public JsonResult findByIdAboutBrand(Integer goods_id) {
		GoodsAboutBrand goods =goodDao.findByIdAboutBrand(goods_id);
		if(goods!=null){
			return new JsonResult(goods);
		}
		return new JsonResult(1);
	}
//	public static void main(String[] args) {
//		
//		new GoodsServiceImpl().findAuto(new CustomGood());
//	}
}
