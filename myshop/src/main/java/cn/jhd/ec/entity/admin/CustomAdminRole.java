package cn.jhd.ec.entity.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomAdminRole extends AdminRole{
	private String[] pers;//具体某权限	
	private Map<String,String> map=new HashMap<String,String>();
	
	public String[] getPers() {
		return pers;
	}

	public void setPers(String[] pers) {
		
		this.pers = pers;
	}

	
	public Map<String, String> getMap() {
		setMap(map);
		return map;
	}

	public void setMap(Map<String, String> map) {
		String per = super.getPermissions();
		if(per!=null&per!=""){
			String[] pers=per.split(",");
			for(int i=0;i<pers.length;i++){
				map.put(pers[i], pers[i]);
			}
		}
		this.map = map;
	}

	@Override
	public void setPermissions(String permissions) {
		if(permissions==""|permissions==null){
			if(pers!=null){
				permissions =pers[0];
				for (int i=1;i<pers.length;i++) {
					permissions+=","+pers[i];
				}
			}
		}
		super.setPermissions(permissions);
	}
	
}
