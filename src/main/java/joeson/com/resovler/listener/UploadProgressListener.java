/**
 * 
 */
package joeson.com.resovler.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import joeson.com.bean.ProgressEntity;
import joeson.com.uitl.JsonUitl;

import org.apache.commons.fileupload.ProgressListener;
import org.springframework.stereotype.Component;

/**
 * @创建人 zjh
 * @创建时间 2018年1月15日
 * @描述
 */
@Component
public class UploadProgressListener implements ProgressListener {

	private HttpSession session;

	public void setSession(HttpSession session) {
		this.session = session;
		Map<Integer,ProgressEntity> status = new HashMap<Integer,ProgressEntity>();
		session.setAttribute("status", status);
	}

	/*
	 * pBytesRead 到目前为止读取文件的比特数 pContentLength 文件总大小 pItems 目前正在读取第几个文件
	 */
	public void update(long pBytesRead, long pContentLength, int pItems) {
//		System.out.println("pBytesRead:"+pBytesRead);
//		System.out.println("pContentLength:"+pContentLength);
//		System.out.println("pItems:"+pItems);
		Map<Integer,ProgressEntity> status = (Map<Integer,ProgressEntity>) session.getAttribute("status");
		if(!status.containsKey(pItems)){
			ProgressEntity entity = new ProgressEntity();
			entity.setpBytesRead(pBytesRead);
			entity.setpContentLength(pContentLength);
			entity.setpItems(pItems);
			status.put(pItems, entity);
		}else{
			ProgressEntity entity = status.get(pItems);
			entity.setpBytesRead(pBytesRead);
			entity.setpContentLength(pContentLength);
			entity.setpItems(pItems);
			status.replace(pItems, entity);
		}
//		System.out.println(JsonUitl.toJson(status));
		session.setAttribute("status", status);
		
	}
}
