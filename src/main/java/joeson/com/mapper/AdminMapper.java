/**
 * 
 */
package joeson.com.mapper;

import java.util.List;

import joeson.com.bean.Date_log;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ctc.wstx.ent.IntEntity;

/**
 * @author joesn
 *
 */
public interface AdminMapper {
	
	@Update("update date_log set userNumber = userNumber+1 where time >=current_date")
	public void updateUserNumberAddOne();
	
	@Update("update date_log set orderNumber=orderNumber+1 where time>=current_date")
	public void updateOrderNumberAddOne();
	
	@Update("update date_log set articleNumber=orderNumber+1 where time>=current_Date")
	public void updateArticleNumberAddOne();
	
	@Update("update date_log set placeNumber=placeNumber+1 where time>=current_Date")
	public void updatePlaceNumber();
	
	@Select("SELECT userNumber from date_log where date(time) = #{date}")
	public Integer selectUserNumber(@Param("date") String date);
	
	@Select("SELECT orderNumber from date_log where date(time) = #{date}")
	public Integer selectOrderNumber(@Param("date") String date);
	
	@Select("select articleNumber from date_log where date(time) = #{date}")
	public Integer selectArticleNumber(@Param("date") String date);
	
	@Select("select placeNumber from date_log where date(time) = #{date}")
	public Integer selectPlaceNumber(@Param("date") String date);
	
	@Select("SELECT "
			+ "sum(userNumber) AS userNumber,"
			+ "sum(orderNumber) AS orderNumber,"
			+ "sum(articleNumber) AS articleNumber,"
			+ "sum(placeNumber) AS placeNumber "
			+ "FROM "
			+ "date_log "
			+ "where "
			+ "seeFlag = 0")
	public Date_log selectNotSeeData();

}
