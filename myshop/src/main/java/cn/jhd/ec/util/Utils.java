package cn.jhd.ec.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FileUtils;
import org.aspectj.util.FileUtil;
import org.springframework.web.multipart.MultipartFile;

import cn.jhd.ec.admin.exception.CustomException;

/**
 * 利用工具类封装 通用算法 
 */
public class Utils {
	private static final String 
		SALT="今天你吃了么?";
	
	public static String md5salt(String pwd){
		return DigestUtils.md5Hex(pwd+SALT);
	}
	
	public static String creat_sn(){
		Date d = new Date(System.currentTimeMillis());
		
		int h = d.getHours();
		int m = d.getMinutes();
		int s = d.getSeconds();
//		System.out.println(h+":"+m+":"+s);
		String aa =h*60*60+m*60+s+"";
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
		String ddd = sdf.format(d);
		return ddd+aa;
	}
	
	public static List<String> strToList(String str,String reg){
		String[] strarr = str.split(reg);
		List<String> strList = new ArrayList<String>();
		for(int i=0;i<strarr.length;i++){
			strList.add(strarr[i]);
		}
		return strList;
	}
	/**
	 * 
	 * @param files
	 * @param path
	 * @return 路径集合
	 * @throws CustomException
	 */
	public static List<String> fileUpload(MultipartFile[] files,String path) throws CustomException{
		List<String> paths = new ArrayList<String>();
		if(files!=null&&files.length>0){  
	            //循环获取file数组中得文件  
	            for(int i = 0;i<files.length;i++){  
	                MultipartFile file = files[i];  
	                //保存文件  
	                String pp = fileUpload(file,path);
	                paths.add(pp);
	            }
	          return paths;  
	       } 
		return null;
	}
	
	public static String fileUpload(MultipartFile file,String path) throws CustomException{
		
		if(file!=null){
			
			//1.获取上传文件原始名称
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);
			//2.新文件名称
			String newFileName="";
			File file1;
			if(originalFilename!=null&originalFilename!=""){
				newFileName = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
				//新文件
				file1 = new File(path+newFileName);
				String picture = newFileName;
				//讲内存中的文件写入磁盘
				
				try {
					file.transferTo(file1);
				} catch (Exception e) {
					throw new CustomException("写入失败！");
				}
			}		
			//图片上传成功，将新图片地址返回
			
			return path+newFileName;
			
		}
		return null;
	}
	
	public static void main(String[] args) {
//		System.out.println(md5salt("123456"));
//		8b394b2718399c8a7d523017ac13575f
		
		
//		System.out.println(creat_sn().substring(0,6));
//		System.out.println(Utils.strToList("goods_manage,remove_back,cat_manage,cat_drop,"
//				+ "feedback_priv,users_manage,users_drop,user_rank,account_manage,"
//				+ "admin_manage,admin_drop,allot_priv,logs_manage,logs_drop,role_manage,"
//				+ "shop_config,ship_manage,payment,navigator,order_os_edit,order_ss_edit,order_edit,"
//				+ "repay_manage", ","));
//		System.out.println(FileUtils.);
//		String ss = "src\\main\\webapp\\client\\images\\20176\\goods_img\\dasdas.jpg".substring(23);
//		System.out.println(dirPathToUrl(ss));
		Long l = System.currentTimeMillis();
//		new Date("");
		System.out.println(l);
	}
	public static String dirPathToUrl(String dirPath){
		System.out.println(dirPath);
		String urlPath = dirPath.replace("\\", "/");
		return urlPath;
	}
}


