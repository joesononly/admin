package joeson.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import joeson.com.bean.Article;
import joeson.com.bean.Result;
import joeson.com.bean.User;
import joeson.com.mapper.ArticleMapper;
import joeson.com.mapper.UserMapper;
import joeson.com.uitl.JsonUitl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	ArticleMapper mapper;
	@Autowired
	UserMapper userMapper;
	
	@RequestMapping("/home")
	public String home(Model model,HttpServletRequest request){
		User token = (User)  request.getSession().getAttribute("user");
		List<Article> articles =  mapper.selectByUserId(token.getUserId(), 0, 10);
		User user = userMapper.selectByName(token.getUsername());
		model.addAttribute("user", user);
		model.addAttribute("articles", articles);
		return "user-home";
	}
	
	@RequestMapping("/set")
	public String getSetPage(Model model,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("user", user);
		return "user-set";
	}
	
	@RequestMapping("/following")
	public String userFollowing(HttpServletRequest request,Model model){
		User token = (User)  request.getSession().getAttribute("user");
		List<User> followers =  userMapper.selectFollowByUserId(token.getUserId(),0,10);
		User user = userMapper.selectByName(token.getUsername());
		model.addAttribute("user", user);
		model.addAttribute("followers", followers);
		return "user-following";
	}
	
	@RequestMapping("/getArticle")
	@ResponseBody
	public String getArticles(Article article,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		List<Article> articles =  mapper.selectByUserId(user.getUserId(), article.getFristNum(), article.getLastNum());
		return JsonUitl.toJson(articles);
	}
	
	@RequestMapping("/getFollow")
	@ResponseBody
	public String getFollow(Integer fristNum,Integer lastNum,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		List<User> follows = userMapper.selectFollowByUserId(user.getUserId(),fristNum,lastNum);
		return JsonUitl.toJson(follows);
	}
	
	@RequestMapping("/getFans")
	@ResponseBody
	public String getFans(Integer fristNum,Integer lastNum,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		List<User> follows = userMapper.selectFansByUserId(user.getUserId(),fristNum,lastNum);
		int size = follows.size();
		for(int i =0;i<size;i++){
			User followeder = follows.get(i);
			followeder.setFollowed(userMapper.isFollowed(user.getUserId(),followeder.getUserId()));
		}
		return JsonUitl.toJson(follows);
	}
	
	@RequestMapping("/addFan/{followId}")
	@ResponseBody
	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout=36000,rollbackFor=Exception.class)
	public String addFollow(@PathVariable Integer followId,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		//添加关注
		userMapper.insertFollow(user.getUserId(), followId);
		Integer follows = userMapper.selectFollowNumberByUserId(user.getUserId());
		follows +=1;
		userMapper.updateFollow(user.getUserId(), follows);
		
		//为被关注的用户添加粉丝
		userMapper.insertFan(followId, user.getUserId());
		Integer fans = userMapper.selectFansNumberByUserId(followId);
		fans+=1;
		userMapper.updateFans(followId, fans);
		
		Result result = new Result();
		result.setCode(200);
		result.setMsg("成功关注");
		return JsonUitl.toJson(result);
	}
	
	
	@RequestMapping("/cancelFollow/{followId}")
	@ResponseBody
	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout=36000,rollbackFor=Exception.class)
	public String cancelFollow(@PathVariable Integer followId,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		//从关注表中删除该用户的记录
		userMapper.deleteFollowerByUserIdAndFollowedId(user.getUserId(), followId);
		Integer followeder = userMapper.selectFollowNumberByUserId(user.getUserId());
		followeder -= 1;
		userMapper.updateFollow(user.getUserId(), followeder);
		
		//减少被关注用户的粉丝数量并删除该用户的粉丝
		userMapper.deleteFanByUserIdAndFanId(followId, user.getUserId());
		Integer fans = userMapper.selectFansNumberByUserId(followId);
		fans -= 1;
		userMapper.updateFans(followId, fans);
		
		Result result = new Result();
		result.setCode(200);
		result.setMsg("取消关注成功");
		return JsonUitl.toJson(result);
	}
	
	@RequestMapping("/reportArticle")
	public String reportArticle(Article article){
		
		return null;
	}
	


}
