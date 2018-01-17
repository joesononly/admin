/**
 * 
 */
package joeson.com.bean;

import java.util.List;

/**
 * @创建人 zjh
 * @创建时间 2018年1月12日
 * @描述 
 */
public class TotalData {

	private List<Integer> userNumber;
	private List<Integer> orderNumber;
	private List<Integer> articleNumber;
	private List<Integer> placeNumber;
	private List<String> dateList;

	public List<String> getDateList() {
		return dateList;
	}
	public void setDateList(List<String> dateList) {
		this.dateList = dateList;
	}
	public List<Integer> getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(List<Integer> userNumber) {
		this.userNumber = userNumber;
	}
	public List<Integer> getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(List<Integer> orderNumber) {
		this.orderNumber = orderNumber;
	}
	public List<Integer> getArticleNumber() {
		return articleNumber;
	}
	public void setArticleNumber(List<Integer> articleNumber) {
		this.articleNumber = articleNumber;
	}
	public List<Integer> getPlaceNumber() {
		return placeNumber;
	}
	public void setPlaceNumber(List<Integer> placeNumberList) {
		this.placeNumber = placeNumberList;
	}

	
	
}
