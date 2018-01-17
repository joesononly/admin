package joeson.com.service;

import java.awt.Rectangle;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import joeson.com.bean.Article;
import joeson.com.bean.Result;
import joeson.com.bean.User;
import joeson.com.mapper.ArticleMapper;
import joeson.com.uitl.ImageHepler;
import joeson.com.uitl.JsonUitl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

/**
 * @创建人 zjh
 * @创建时间 2017-12-18
 * @描述 编写文章时对图片进行的操作，增删
 * */
@Service
public class ImageService {
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Value("${my.save.image.path}")
	private String savePath;
	
	@Value("${my.save.image.dest.path}")
	private String destPath;
	
	/**
	 * @描述 保存上传的图片，并返回图片显示地址
	 * */
	public String saveImage(MultipartFile file){
		Result result = new Result();
		Gson gson = new Gson();
		if(file.isEmpty()){
			result.setCode(500);
			result.setMsg("文件为空");
			return gson.toJson(result);
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String tempDir = format.format(new Date());
		File saveDir = new File(savePath+File.separator+tempDir);
		if(!saveDir.exists())
			saveDir.mkdirs();
		format.applyPattern("yyyyMMddHHmmssSSS");
		String fileName = file.getOriginalFilename();
		int start = fileName.indexOf(".");
		int end = fileName.length();
		String fix = fileName.substring(start, end);
		String tempName = format.format(new Date())+fix;
		File temp = new File(saveDir,tempName);
		String tempPath = "";
		try {
			file.transferTo(temp);
			tempPath = "/edit/show/"+tempName;
			result.setLink(tempPath);
		} catch (IllegalStateException e) {
			result.setCode(500);
			result.setMsg(e.getMessage());
			e.printStackTrace();
			return gson.toJson(result);
		} catch (IOException e) {
			result.setCode(500);
			result.setMsg(e.getMessage());
			e.printStackTrace();
			return gson.toJson(result);
		}
		return gson.toJson(result);
	}
	
	/**
	 * @描述 保存文章封面，文件命名格式：yyyyMMddhhmmssSSSUserId
	 * */
	public String articleImage(MultipartFile file,HttpServletRequest request){
		Result result = new Result();
		Gson gson = new Gson();
		if(file.isEmpty()){
			result.setCode(500);
			result.setMsg("文件为空");
			return gson.toJson(result);
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String tempDir = format.format(new Date());
		User user = (User) request.getSession().getAttribute("user");
		tempDir = savePath+File.separator+user.getUserId()+File.separator+tempDir;
		File saveDir = new File(tempDir);
		if(!saveDir.exists())
			saveDir.mkdirs();
		format.applyPattern("yyyyMMddHHmmssSSS");
		String fileName = file.getOriginalFilename();
		int start = fileName.indexOf(".");
		int end = fileName.length();
		String fix = fileName.substring(start, end);
		String tempName = format.format(new Date())+user.getUserId()+fix;
		File temp = new File(saveDir,tempName);
		String tempPath = "";
		try {
			file.transferTo(temp);
			tempPath = "/edit/showArticle/"+tempName;
			result.setLink(tempPath);
		} catch (IllegalStateException e) {
			result.setCode(500);
			result.setMsg(e.getMessage());
			e.printStackTrace();
			return gson.toJson(result);
		} catch (IOException e) {
			result.setCode(500);
			result.setMsg(e.getMessage());
			e.printStackTrace();
			return gson.toJson(result);
		}
		return gson.toJson(result);
	}
	
	
	/**
	 * @描述 删除图片
	 * */
	public String deleteImage(String fileName){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String tempDir = format.format(new Date());
		String path = savePath+File.separator+tempDir;
		File file = new File(Paths.get(path, fileName).toString());
		Result result = new Result();
		if(file.delete()){
			result.setCode(200);
		}else{
			result.setCode(404);
		}
		return JsonUitl.toJson(result);
	}
	
	public String addArticle(Article article){
		articleMapper.add(article);
		return null;
	}
	
	public String saveCover(MultipartFile file,int rWidth,int rHeight,int x,int y,int width,int height,int id){
		Result result = new Result();
		if(file.isEmpty()){
			result.setCode(500);
			result.setMsg("文件为空");
			return JsonUitl.toJson(result);
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String tempDir = format.format(new Date());
		File saveDir = new File(savePath+File.separator+tempDir);
		if(!saveDir.exists())
			saveDir.mkdirs();
		format.applyPattern("yyyyMMddHHmmssSSS");
		String fileName = file.getOriginalFilename();
		int start = fileName.indexOf(".");
		int end = fileName.length();
		String fix = fileName.substring(start, end);
		String tempName = format.format(new Date())+fix;
		File temp = new File(saveDir,tempName);
		String tempPath = "";
		try {
			file.transferTo(temp);
			tempPath = "/edit/show/"+tempName;
			File destDri = new File(destPath);
			if(!destDri.exists())
				destDri.mkdirs();
			File dest = new File(destPath+File.separator+tempName);
			if(dest.exists())
				dest.delete();
			dest.createNewFile();
			Rectangle r = new Rectangle(x, y, width, height);
			ImageHepler.cut(temp, dest, rWidth, rHeight, r);
			articleMapper.updateArticleImageById(id, tempName);
			result.setLink("/edit/show/dest/"+tempName);
		} catch (IllegalStateException e) {
			result.setCode(500);
			result.setMsg(e.getMessage());
			e.printStackTrace();
			return JsonUitl.toJson(result);
		} catch (IOException e) {
			result.setCode(500);
			result.setMsg(e.getMessage());
			e.printStackTrace();
			return JsonUitl.toJson(result);
		}
		return JsonUitl.toJson(result);
	}

}
