package joeson.com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import joeson.com.bean.User;

@Service
public class UserService {
	
	public void addUserToSession(HttpServletRequest request){
		
	}
	
	public boolean isLogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null)
			return true;
		else
			return false;
	}

}
