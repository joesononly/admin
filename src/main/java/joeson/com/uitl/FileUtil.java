/**
 * 
 */
package joeson.com.uitl;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

/**
 * @创建人 zjh
 * @创建时间 2018年1月16日
 * @描述
 */
public class FileUtil {

	public static String getFileHeader(MultipartFile file) {
		InputStream is = null;
		String value = null;
		try {
			is = file.getInputStream();
			byte[] b = new byte[4];
			is.read(b, 0, b.length);
			value = bytesToHexString(b);
		} catch (Exception e) {
		} finally {
			if (null != is) {
				try {
					is.close();
				} catch (IOException e) {
				}
			}
		}
		return value;
	}

	private static String bytesToHexString(byte[] src) {
		StringBuilder builder = new StringBuilder();
		if (src == null || src.length <= 0) {
			return null;
		}
		String hv;
		for (int i = 0; i < src.length; i++) {
			hv = Integer.toHexString(src[i] & 0xFF).toUpperCase();
			if (hv.length() < 2) {
				builder.append(0);
			}
			builder.append(hv);
		}
		System.out.println(builder.toString());
		return builder.toString();
	}

}
