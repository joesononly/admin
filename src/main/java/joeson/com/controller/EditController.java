package joeson.com.controller;

import java.io.File;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import joeson.com.bean.Article;
import joeson.com.bean.User;
import joeson.com.mapper.AreaMapper;
import joeson.com.mapper.ArticleMapper;
import joeson.com.service.ImageService;
import joeson.com.uitl.JsonUitl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @创建人 zjh
 * @创建时间 2017-12-18
 * @描述 文章编写Controller类
 * */
@Controller
public class EditController {

	@Value("${my.save.image.path}")
	private String ROOT;
	
	@Value("${my.save.image.dest.path}")
	private String destPath;
	  
    private final ResourceLoader resourceLoader; 
	
	@Autowired
	ImageService service;
	
	@Autowired
	ArticleMapper mapper;
	
	@Autowired
	AreaMapper areaMapper;
	
	@Autowired  
    public EditController(ResourceLoader resourceLoader) {  
        this.resourceLoader = resourceLoader;  
    }  
	
	@RequestMapping("/edit/home")
	public String indexHome(Model model,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("articles",mapper.selectList(user.getUserId()));
		return "edit-article";
	}
	
	@RequestMapping("/edit")
	public String edit(Model model,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("article", mapper.selectLimitOneByUserId(user.getUserId()));
		return "edit";
	}
	
	@RequestMapping("/edit/result")
	public String result(Integer id,Model model){
		model.addAttribute("article", mapper.selectById(id));
		model.addAttribute("countries", areaMapper.selectCountries());
		return "edit-result";
	}
	
	@RequestMapping("/edit/upload")
	@ResponseBody
	public String uploadImage(@RequestParam("file") MultipartFile file){
		return  service.saveImage(file);
	}
	
	@RequestMapping("/edit/uploadCover")
	@ResponseBody
	public String uploadCover(@RequestParam("file") MultipartFile file,
								@RequestParam("rWidth") String rWidth,
								@RequestParam("rHeight") String rHeight,
								@RequestParam("x") String x,
								@RequestParam("y") String y,
								@RequestParam("width") String width,
								@RequestParam("height") String height,
								@RequestParam("id") Integer id){
		return  service.saveCover(file, Integer.valueOf(rWidth),Integer.valueOf(rHeight), Integer.valueOf(x), Integer.valueOf(y), Integer.valueOf(width), Integer.valueOf(height),id);
	}
	
	@RequestMapping(value = "/edit/articleImage", method = RequestMethod.POST, consumes = "multipart/form-data")
	@ResponseBody
	public String articleImage(@RequestParam("file") MultipartFile file,HttpServletRequest request){
		return  service.articleImage(file, request);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/edit/show/{fileName:.+}")  
    @ResponseBody 
	public ResponseEntity<?> showImage(@PathVariable String fileName){
		try {  
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			String tempDir = format.format(new Date());
			String path = ROOT+File.separator+tempDir;
	        return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(path, fileName).toString()));  
        } catch (Exception e) {  
            return ResponseEntity.notFound().build();  
        }  
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/edit/show/dest/{fileName:.+}")  
    @ResponseBody 
	public ResponseEntity<?> showCover(@PathVariable String fileName){
		try {  
	        return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(destPath, fileName).toString()));  
        } catch (Exception e) {  
            return ResponseEntity.notFound().build();  
        }  
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/edit/showArticle/{fileName:.+}")  
    @ResponseBody 
	public ResponseEntity<?> showArticle(@PathVariable String fileName,HttpServletRequest request){
		try {  
			User user = (User) request.getSession().getAttribute("user");
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			String tempDir = format.format(new Date());
			tempDir = ROOT+File.separator+user.getUserId()+File.separator+tempDir;
			
	        return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(tempDir, fileName).toString()));  
        } catch (Exception e) {  
            return ResponseEntity.notFound().build();  
        }  
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/edit/delete/{fileName:.+}")  
	@ResponseBody
	public String deleteImage(@PathVariable String fileName){
		
		return service.deleteImage(fileName);
	}
	
	@RequestMapping("/edit/addArticle")
	@ResponseBody
	public String addArticle(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Article article  = new Article();
		article.setTitle("新建文章");
		article.setUserId(user.getUserId());
		mapper.add(article);
		return JsonUitl.toJson(article);
	}
	
	@RequestMapping("/edit/saveArticle")
	@ResponseBody
	public String saveArticle(Article article,Model model){
		mapper.updateArticle(article);
		String link = "/edit/result?id="+article.getId();
		return JsonUitl.toJson(link);
	}
	
	@RequestMapping("/edit/get")
	@ResponseBody
	public String addActicle(int id){
		Article article = mapper.selectById(id);
		return JsonUitl.toJson(article);
	}
	

	
	@RequestMapping("/edit/report")
	@ResponseBody
	public String reportArticle(Article article){
		article.setReport(1);
		mapper.updateReport(article);
		return JsonUitl.toJson(article.getId());
	}
}
