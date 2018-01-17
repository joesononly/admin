package joeson.com.controller;

import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import joeson.com.bean.Article;
import joeson.com.bean.TotalData;
import joeson.com.bean.User;
import joeson.com.mapper.AdminMapper;
import joeson.com.mapper.ArticleMapper;
import joeson.com.mapper.UserMapper;
import joeson.com.uitl.JsonUitl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin")
public class AdminController{
	
	@Value("${my.save.user.image.path}")
	private String ROOT;  
	
	private final ResourceLoader resourceLoader; 
	
	@Autowired
	ArticleMapper mapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired  
    public AdminController(ResourceLoader resourceLoader) {  
        this.resourceLoader = resourceLoader;  
    }  
	
	@RequestMapping()
	public String index(){
		
		return "admin";
	}
	
	@RequestMapping("/total")
	public String adminTotal(Model model){
		model.addAttribute("notSeeData", adminMapper.selectNotSeeData());
		return "admin-total";
	}
	
	@RequestMapping("/personAdmin")
	public String personAdmin(Model model){
		List<Article> articles =  mapper.selectByUserId(1, 0, 10);
		User user = userMapper.selectByName("joeson2");
		model.addAttribute("user", user);
		model.addAttribute("articles", articles);
		return "personAdmin";
	}
	
	@RequestMapping("/getArticle")
	@ResponseBody
	public String getArticles(Article article){
		List<Article> articles =  mapper.selectByUserId(1, article.getFristNum(), article.getLastNum());
		return JsonUitl.toJson(articles);
	}
	
	@RequestMapping(value = "/show/{fileName:.+}")  
    @ResponseBody 
	public ResponseEntity<?> getUserImage(@PathVariable String fileName){
		try {  
	        return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(ROOT, fileName).toString()));  
        } catch (Exception e) {  
            return ResponseEntity.notFound().build();  
        }  
	}
	
	@RequestMapping("/getTotalData")
	@ResponseBody
	public String getTotalData(Integer date){
		Calendar calendar = Calendar.getInstance(); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		List<String> dateList = new ArrayList<String>();
		for(int i = date;i>0;i--){
			calendar.add(Calendar.DATE, -1);
			dateList.add(format.format(calendar.getTime()));
		}
		Collections.reverse(dateList);
		List<Integer> userNumberList = new ArrayList<Integer>();
		List<Integer> orderNumberList = new ArrayList<Integer>();
		List<Integer> articleNumberList = new ArrayList<Integer>();
		List<Integer> placeNumberList = new ArrayList<Integer>();
		for(String s:dateList){
			Integer userNumber = adminMapper.selectUserNumber(s);
			userNumber = userNumber==null?0:userNumber;
			userNumberList.add(userNumber);
			
			Integer orderNumber = adminMapper.selectOrderNumber(s);
			orderNumber = orderNumber==null?0:orderNumber;
			orderNumberList.add(orderNumber);
			
			Integer articleNumber = adminMapper.selectArticleNumber(s);
			articleNumber = articleNumber==null?0:articleNumber;
			articleNumberList.add(articleNumber);
			
			Integer placeNumber = adminMapper.selectPlaceNumber(s);
			placeNumber = placeNumber==null?0:placeNumber;
			placeNumberList.add(placeNumber);
		}
		
		TotalData totalData= new TotalData();
		totalData.setUserNumber(userNumberList);
		totalData.setOrderNumber(orderNumberList);
		totalData.setArticleNumber(articleNumberList);
		totalData.setPlaceNumber(placeNumberList);
		totalData.setDateList(dateList);
		return JsonUitl.toJson(totalData);
	}
	
	
}