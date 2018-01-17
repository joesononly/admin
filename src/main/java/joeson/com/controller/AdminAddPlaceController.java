/**
 * 
 */
package joeson.com.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.DateFormatter;

import joeson.com.bean.ProgressEntity;
import joeson.com.bean.Result;
import joeson.com.uitl.FileUtil;
import joeson.com.uitl.JsonUitl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @创建人 zjh
 * @创建时间 2018年1月15日
 * @描述 
 */
@Controller
@RequestMapping("admin/place")
public class AdminAddPlaceController {

	@Value("${my.save.image.path}")
	private String savePath;
	
	@RequestMapping
	public String index(){
		return "admin-add-place";
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(HttpServletRequest request,@RequestParam("image") MultipartFile[] images){
		Result result = new Result();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String dirDate = format.format(new Date());
		File dir = new File(savePath+File.separator+dirDate);
		if(!dir.exists())
			dir.mkdirs();
		List<String> linkList = new ArrayList<String>();
		for(MultipartFile file:images){
			System.out.println(file.getOriginalFilename());
			FileUtil.getFileHeader(file);
			String fileName = file.getOriginalFilename();
			int start = fileName.indexOf(".");
			int end = fileName.length();
			String fix = fileName.substring(start, end);
			format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String cacheFileName = format.format(new Date())+fix;
			File cacheFile = new File(savePath+File.separator+dirDate,cacheFileName);
			try {
				file.transferTo(cacheFile);
				linkList.add(cacheFileName);
			} catch (IllegalStateException e) {
				result.setCode(500);
				result.setMsg(e.getMessage());
				e.printStackTrace();
			} catch (IOException e) {
				result.setCode(500);
				result.setMsg(e.getMessage());
				e.printStackTrace();
			}
		}
		result.setCode(200);
		result.setLinkList(linkList);
//		request.getSession().removeAttribute("status");
		return JsonUitl.toJson(result);
	}
	
	@RequestMapping("/getProgress")
	@ResponseBody
	public String getUploadProgress(HttpServletRequest request){
		HttpSession session = request.getSession();
		Map<Integer, ProgressEntity> progressEntity = (Map<Integer, ProgressEntity>) session.getAttribute("status");
		System.out.println(JsonUitl.toJson("getSession---> "+progressEntity));
		return JsonUitl.toJson(progressEntity);
	}
}
