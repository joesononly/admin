/**
 * 
 */
package joeson.com.bean;

import java.sql.Timestamp;

/**
 * @创建人 zjh
 * @创建时间 2018年1月13日
 * @描述 
 */
public class Date_log {

	private int id;
	private Integer userNumber;
	private Integer orderNumber;
	private Integer articleNumber;
	private Integer placeNumber;
	private Timestamp time;
	private boolean seeFlag;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Integer getArticleNumber() {
		return articleNumber;
	}
	public void setArticleNumber(Integer articleNumber) {
		this.articleNumber = articleNumber;
	}
	public Integer getPlaceNumber() {
		return placeNumber;
	}
	public void setPlaceNumber(Integer placeNumber) {
		this.placeNumber = placeNumber;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public boolean isSeeFlag() {
		return seeFlag;
	}
	public void setSeeFlag(boolean seeFlag) {
		this.seeFlag = seeFlag;
	}

	
	
}
