package cn.jhd.ec.client.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.fasterxml.jackson.databind.JavaType;
//import com.fasterxml.jackson.databind.ObjectMapper;

import cn.jhd.ec.client.service.UserService;
import cn.jhd.ec.entity.users.User;
import cn.jhd.ec.util.JsonResult;
import net.sf.json.JSONObject;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	//1.登陆
	@RequestMapping("/login.do")
	@ResponseBody
	public JsonResult login(String userName,String password){
		System.out.println(userName+":"+password);
		JsonResult<User> jr = userService.login(userName, password);
		
		return jr;
		
	}
//	//1.1请求到首页
//	@RequestMapping("/index.do")
//	public String toIndex(){
//		return "index";
//	}
	//2.退出
	@RequestMapping("/logout.do")
	@ResponseBody
	public JsonResult<User> logout(HttpServletRequest req){
		HttpSession session = req.getSession();
		
			
			return new JsonResult<User>(0);//说明退出成功
		
//		return new JsonResult<User>(1);//退出失败，说明已经退出，要退出对象不存在
	}
	
	//3.注册
	@RequestMapping("/regist.do")
	@ResponseBody
	public JsonResult<User> regist(@RequestBody String user,HttpServletRequest req){

		JSONObject jsonObject=JSONObject.fromObject(user);
		User user1=(User)JSONObject.toBean(jsonObject, User.class);

		if(checkUserName(user1.getUser_name()).getState()==0){//如果验证通过则可注册
			JsonResult<User> jr = userService.register(user1);
			return jr;
		}
		return new JsonResult<User>(1);//验证未通过
	}
	/**
	 * 获取json字符串对象，解析成java对象的例子
	 * @param userName
	 * @return
	 */
//	@RequestMapping(value = "/saveUser.do", method = RequestMethod.POST)    
//    public  void myDomain(HttpServletRequest request, @RequestBody String myDomain) throws Exception{  
//          
//        ObjectMapper objectMapper = new ObjectMapper();  
//        JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, MyDomain.class);  
//        List<MyDomain> list = objectMapper.readValue(myDomain, javaType);  
//      
//        System.out.println(list); 
////        return "text.html";
//    }    
	
	//4.验证用户名/
	@RequestMapping("/checkUserName.do")
	@ResponseBody
	public JsonResult<User> checkUserName(String userName){
		return userService.checkUserName(userName);
	}
	//5.修改用户信息
	@RequestMapping("/edit.do")
	@ResponseBody
	public JsonResult<User> edit(@RequestBody String user,HttpServletRequest req){
		JSONObject jsonObject=JSONObject.fromObject(user);
		User user1=(User)JSONObject.toBean(jsonObject, User.class);
		
		JsonResult<User> jr = userService.editUser(user1);
		
		return jr;
	}
	//6.修改密码
	@RequestMapping("/checkpwd.do")
	@ResponseBody
	public JsonResult<User> updetepwd(Integer user_id,String oldpwd,String newpwd){
		return userService.updatePwd(user_id, oldpwd, newpwd);
	}
}
