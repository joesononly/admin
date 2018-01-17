package joeson.com.resovler;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import joeson.com.resovler.listener.UploadProgressListener;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * @创建人 zjh
 * @创建时间 2018年1月15日
 * @描述
 */
public class CustomMultipartResolver extends CommonsMultipartResolver {
	@Autowired
	private UploadProgressListener uploadProgressListener;

	@Override
	protected MultipartParsingResult parseRequest(HttpServletRequest request)
			throws MultipartException {
		String encoding = determineEncoding(request);
		FileUpload fileUpload = prepareFileUpload(encoding);
		uploadProgressListener.setSession(request.getSession());// 问文件上传进度监听器设置session用于存储上传进度
		System.out.println(this.getClass().getName()+"--->"+request.getSession().getAttribute("status"));
		fileUpload.setProgressListener(uploadProgressListener);// 将文件上传进度监听器加入到
																// fileUpload 中
		try {
			List<FileItem> fileItems = ((ServletFileUpload) fileUpload)
					.parseRequest(request);
			return parseFileItems(fileItems, encoding);
		} catch (FileUploadBase.SizeLimitExceededException ex) {
			throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(),
					ex);
		} catch (FileUploadBase.FileSizeLimitExceededException ex) {
			throw new MaxUploadSizeExceededException(
					fileUpload.getFileSizeMax(), ex);
		} catch (FileUploadException ex) {
			throw new MultipartException(
					"Failed to parse multipart servlet request", ex);
		}
	}
}
