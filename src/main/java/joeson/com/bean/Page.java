/**
 * 
 */
package joeson.com.bean;

import java.util.List;

/**
 * @创建人 zjh
 * @创建时间 2018年1月13日
 * @描述 
 */
public class Page<T> {

	public List<T> dataList;
	public long total;
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
	
}
