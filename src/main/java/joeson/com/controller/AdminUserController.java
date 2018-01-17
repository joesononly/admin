/**
 * 
 */
package joeson.com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import joeson.com.bean.TotalData;
import joeson.com.bean.User;
import joeson.com.mapper.AdminMapper;
import joeson.com.mapper.ArticleMapper;
import joeson.com.mapper.UserMapper;
import joeson.com.uitl.JsonUitl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * @创建人 zjh
 * @创建时间 2018年1月13日
 * @描述 
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	ArticleMapper articleMapper;

	@RequestMapping
	public String index(Model model){
		model.addAttribute("hotArticleList", articleMapper.selectArticlesByHot());
		model.addAttribute("userList", userMapper.selectToAdminPage());
		return "admin-user";
	}
	
	@RequestMapping("/get/list")
	@ResponseBody
	public String getList(Integer pageIndex,Integer pageSize){
		PageHelper.startPage(pageIndex, pageSize);
		List<User> userList = userMapper.selectToPage();
		Page<User> userListPage = (Page<User>) userList;
		
		joeson.com.bean.Page<User> page = new joeson.com.bean.Page<User>();
		page.setDataList(userList);
		double cacheTotal = userListPage.getTotal()/(double)pageSize;
		page.setTotal((int)Math.ceil(cacheTotal));
		return JsonUitl.toJson(page);
	}
	
	
	@RequestMapping("/get/userData")
	@ResponseBody
	public String getUserDataToLine(Integer date){
		Calendar calendar = Calendar.getInstance(); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		List<String> dateList = new ArrayList<String>();
		for(int i = date;i>0;i--){
			calendar.add(Calendar.DATE, -1);
			dateList.add(format.format(calendar.getTime()));
		}
		Collections.reverse(dateList);
		List<Integer> userNumberList = new ArrayList<Integer>();
		for(String s:dateList){
			Integer userNumber = adminMapper.selectUserNumber(s);
			userNumber = userNumber==null?0:userNumber;
			userNumberList.add(userNumber);
		}
		
		TotalData totalData= new TotalData();
		totalData.setUserNumber(userNumberList);
		totalData.setDateList(dateList);
		return JsonUitl.toJson(totalData);
	}
	
	@RequestMapping("/get/userAge")
	@ResponseBody
	public String getUserAgeToChar(){
		Calendar calendar = Calendar.getInstance();
		Map<String, Object> part1 = new HashMap<String, Object>();
		Map<String, Object> part2 = new HashMap<String, Object>();
		Map<String, Object> part3 = new HashMap<String, Object>();
		Map<String, Object> part4 = new HashMap<String, Object>();
		Map<String, Object> part5 = new HashMap<String, Object>();
		Map<String, Object> part6 = new HashMap<String, Object>();
		
		String end = String.valueOf(calendar.get(Calendar.YEAR)-18);
		String start = String.valueOf(calendar.get(Calendar.YEAR)-30);
		part1.put("name", "18-30岁");
		part1.put("value", userMapper.selectUserCount(start, end));
		
		end = String.valueOf(calendar.get(Calendar.YEAR)-30);
		start = String.valueOf(calendar.get(Calendar.YEAR)-35);
		part2.put("name", "30-35岁");
		part2.put("value", userMapper.selectUserCount(start, end));
		
		end = String.valueOf(calendar.get(Calendar.YEAR)-35);
		start = String.valueOf(calendar.get(Calendar.YEAR)-40);
		part3.put("name", "35-40岁");
		part3.put("value", userMapper.selectUserCount(start, end));
		
		end = String.valueOf(calendar.get(Calendar.YEAR)-40);
		start = String.valueOf(calendar.get(Calendar.YEAR)-55);
		part4.put("name", "44-55岁");
		part4.put("value", userMapper.selectUserCount(start, end));
		
		end = String.valueOf(calendar.get(Calendar.YEAR)-55);
		part5.put("name", "55岁以上");
		part5.put("value", userMapper.selectUserCountToFifty(end));
		
		part6.put("name", "未知年龄");
		part6.put("value", userMapper.selectUserCountToUnknow());
		
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		result.add(part1);
		result.add(part2);
		result.add(part3);
		result.add(part4);
		result.add(part5);
		result.add(part6);
		
		return JsonUitl.toJson(result);
	}
}
