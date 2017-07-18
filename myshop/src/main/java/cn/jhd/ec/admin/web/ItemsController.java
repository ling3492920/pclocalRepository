package cn.jhd.ec.admin.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.jhd.ec.admin.exception.CustomException;
import cn.jhd.ec.admin.service.AGoodsService;
import cn.jhd.ec.entity.goods.CustomGoods;
import cn.jhd.ec.entity.goods.Good;
import cn.jhd.ec.util.JsonResult;
import cn.jhd.ec.util.Utils;

@Controller
@RequestMapping("/agoods")
public class ItemsController {
	@Resource
	private AGoodsService aGoodsService;
	
	/**
	 *查询商品列表
	 * @param startLine
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public JsonResult show(Integer startLine,Integer pageSize){
//		System.out.println(startLine+":"+pageSize);
		return aGoodsService.findAll2(startLine,pageSize);
	}
	@RequestMapping("/count.do")
	@ResponseBody
	public JsonResult count(){
		return aGoodsService.count();
	}
	//去修改页面
	@RequestMapping("/toEdit.do")
	@RequiresPermissions("goods_add_edit")
	public String showOne(Integer id,Model model){
		Good goods = aGoodsService.findById(id);
		model.addAttribute("goods", goods);
		return "itemManage/editItem";
	}
	//添加
	@RequestMapping("/save.do")
	@RequiresPermissions("goods_add_edit")
	public String save(Good good,@RequestParam("goodsimg") MultipartFile goodsimg,
			@RequestParam("imgurl") MultipartFile imgurl[],HttpServletRequest req){
		//1. 获得项目的路径
		ServletContext sc = req.getSession().getServletContext();
		System.out.println("项目路径为："+sc);
		//2.上传位置
		String path = sc.getRealPath("/img") + "/"; // 设定文件保存的目录
		System.out.println("path:"+path);
		System.out.println("商品名称："+good.getGoods_name()+"商品货号:"+good.getGoods_sn());
		
//		try {
//			String newGoods_imgPath=Utils.fileUpload(goodsimg, path);
//			String urlPath = Utils.dirPathToUrl((newGoods_imgPath.substring(23)));
//			
//			String newGoods_thumbPath=Utils.fileUpload(goodsthumb, path);
//			String urlPath2 = Utils.dirPathToUrl((newGoods_thumbPath.substring(23)));
//			
//			List<String> newSource_imgPaths=Utils.fileUpload(imgurl, path);
//			for (String newSourceimg : newSource_imgPaths) {
//				String urlPath3=Utils.dirPathToUrl((newSourceimg.substring(23)));
//				//设置到对应gallery表中……
//			}
			
//			if(urlPath!=null){
//				good.setGoods_img(urlPath);
//			}
//			if(urlPath2!=null){
//				good.setGoods_thumb(urlPath2);
//			}
			System.out.println("_进入try");
			
			good.setGoods_desc("暂无描述");
			
			System.out.println("goods_desc:"+good.getGoods_desc());
			JsonResult jr=aGoodsService.save(good);
			System.out.println("存储good结束");
			if(jr.getState()==1){
				req.setAttribute("errors", jr.getMessage());
				req.setAttribute("goods", good);
				return "forward:toAdd.do";
			}
			//添加成功转到商品列表页面
			return "templates/goods_list";
//		} catch (Exception e) {
//			//把good转发给异常请求处理
//			req.setAttribute("errors","未知异常");
//			//下面是转发
//			return "forward:toError.do";
//			
//		}
		
		
	}
	@RequestMapping("/toError.do")
	public String toError(HttpServletRequest req){
		System.out.println("model是否包含goods属性："+req.getAttribute("goods"));
		if(req.getAttribute("goods")!=null){//转发请求如果有goods属性
			//请求
			return "itemManage/addgoods";
		}
		//不包含就直接请求异常页面
		return "error";
	}
	
	//修改
	@RequestMapping("/edit.do")
	@RequiresPermissions("goods_add_edit")
	public String editById(Good good,@RequestParam("goodsimg") MultipartFile goodsimg,@RequestParam("imgurl") MultipartFile imgurl[],Model model) throws CustomException{
		System.out.println(good.getGoods_id()+":"+good.getGoods_name());
		//图片上传成功后，将图片的地址写到数据库
		String rootPath="src\\main\\webapp\\client\\images\\"+Utils.creat_sn().substring(0,6);
		
		String goods_imgPath=rootPath+"\\goods_img\\";	
		String newGoods_imgPath=Utils.fileUpload(goodsimg, goods_imgPath);
		String urlPath = Utils.dirPathToUrl((newGoods_imgPath.substring(23)));
		if(urlPath!=null){
			good.setGoods_img(urlPath);
		}
		
//		String goods_thumbPath=rootPath+"\\goods_thumb\\";
//		String newGoods_thumbPath=Utils.fileUpload(goodsthumb, goods_thumbPath);
//		String urlPath1=Utils.dirPathToUrl((newGoods_thumbPath.substring(23)));
//		good.setGoods_thumb(urlPath1);
		//这里是关联商品的所有图片，存放到对应表中
		String source_imgPath=rootPath+"\\source_image\\";
		List<String> newSource_imgPaths=Utils.fileUpload(imgurl, source_imgPath);
		for (String newSourceimg : newSource_imgPaths) {
			String urlPath2=Utils.dirPathToUrl((newSourceimg.substring(23)));
			//设置到对应gallery表中……
		}
		
		JsonResult jr=aGoodsService.editById(good);
		if(jr.getState()==0){
			return "templates/goods_list";
		}
//		return "redirect:show.do?startLine=0&pageSize=15";
		//如果失败把失败消息显示到异常页面
		model.addAttribute("errors", jr.getMessage());
		return "error";
	}
	//列表内修改状态
	@RequestMapping("/editIS.do")
	@RequiresPermissions("goods_add_edit")
	@ResponseBody
	public JsonResult editIS(Integer id,String str,Integer val){
		Good good = new Good();
		good.setGoods_id(id);
		if("is_on_sale".equals(str)){
			good.setIs_on_sale(val);
			aGoodsService.editById(good);
			return new JsonResult(0,"修改是否上架成功",val);
		}
		if("is_best".equals(str)){
			good.setIs_best(val);
			aGoodsService.editById(good);
			return new JsonResult(0,"修改是否精品成功",val);
		}	
		if("is_new".equals(str)){
			good.setIs_new(val);
			aGoodsService.editById(good);
			return new JsonResult(0,"修改是否新品成功",val);
		}
		if("is_hot".equals(str)){
			good.setIs_hot(val);
			aGoodsService.editById(good);
			return new JsonResult(0,"修改是否需热销成功",val);
		}	
		return new JsonResult(1); 
	}
	
	@RequestMapping("/editBase.do")
	@RequiresPermissions("goods_add_edit")
	@ResponseBody
	public JsonResult editBase(Integer id,String str,String val){
		return aGoodsService.editBase(id, str, val);
	}
	
	//将商品放入回收站
	@RequestMapping("/del")
	@RequiresPermissions("goods_del_cellback")
	@ResponseBody
	public JsonResult cellback(Integer id){
		return aGoodsService.delById(id);
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public JsonResult seach(@RequestBody CustomGoods cgs){
		System.out.println(cgs.getCat_id()+":"+cgs.getBrand_id()+":"+cgs.getStartLine()+":"+cgs.getPageSize());
		JsonResult jr=aGoodsService.findauto(cgs);
		System.out.println("数据量："+((List<Good>)jr.getData()).size());
		return jr;
	}
}
