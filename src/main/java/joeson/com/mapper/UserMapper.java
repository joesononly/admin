package joeson.com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import joeson.com.bean.User;

public interface UserMapper {
	
	@Insert("insert into user(username,password) values(#{username},#{password})")
	public void insert(User user);
	
	@Insert("insert into user_follow(userId,followedId) values(#{userId},#{followedId})")
	public void insertFollow(@Param("userId") int userId,@Param("followedId") int followedId);
	
	@Insert("insert into user_fan(userId,fanId) values(#{userId},#{fanId})")
	public void insertFan(@Param("userId") int userId,@Param("fanId") int fanId);

	@Delete("delete from user where id = #{id}")
	public void delete();
	
	@Delete("delete from user_follow where userId = #{userId} and followedId = #{followedId}")
	public void deleteFollowerByUserIdAndFollowedId(@Param("userId") int userId,@Param("followedId") int followedId);
	
	@Delete("delete from user_fan where userId = #{userId} and fanId = #{fanId}")
	public void deleteFanByUserIdAndFanId(@Param("userId") int userId,@Param("fanId") int fanId);

	@Update("update user set username = #{username},password=#{password} where id = #{id}")
	public void update(User user);
	
	@Update("update user set fans = #{fans} where userId = #{id}")
	public void updateFans(@Param("id") int id,@Param("fans") int fans);
	
	@Update("update user set followeder = #{followeder} where userId = #{userId}")
	public void updateFollow(@Param("userId") int userId,@Param("followeder") int followeder);

	@Select("select * from user")
	public List<User> select();
	
	@Select("select username,level,date_format(registerTime,'%Y-%m-%d %H:%i:%s') as registerTime,articleNumber,fans,likeNumber from user")
	public List<User> selectToPage();
	
	@Select("select * from user where username = #{username}")
	public User selectByName(String username);
	
	@Select("select userId,username,articleNumber,fans,likeNumber,registerTime,level from user order by level desc limit 0,5")
	public List<User> selectToAdminPage();
	
	@Select("SELECT userId,username,fans,followeder,likeNumber,userImagePath FROM USER WHERE userId IN ( SELECT followedId FROM user_follow WHERE userId = #{id}) limit #{fristNum},#{lastNum} ")
	public List<User> selectFollowByUserId(@Param("id") int id,@Param("fristNum") int fristNum,@Param("lastNum") int lastNum);
	
	@Select("SELECT userId,username,fans,followeder,likeNumber,userImagePath FROM USER WHERE userId IN ( SELECT fanId FROM user_fan WHERE userId = #{id}) limit #{fristNum},#{lastNum}")
	public List<User> selectFansByUserId(@Param("id") int id,@Param("fristNum") int fristNum,@Param("lastNum") int lastNum);
	
	@Select("select fans from user where userId = #{id}")
	public int selectFansNumberByUserId(@Param("id") int id);
	
	@Select("select followeder from user where userId = #{id}")
	public int selectFollowNumberByUserId(@Param("id") int id);
	
	@Select("select count(0) from user where bornDate between STR_TO_DATE(#{start},'%Y') and STR_TO_DATE(#{end},'%Y') ")
	public Integer selectUserCount(@Param("start") String start,@Param("end") String end);
	
	@Select("select count(0) from user where bornDate < STR_TO_DATE(#{end},'%Y')")
	public Integer selectUserCountToFifty(@Param("end") String end);
	
	@Select("select count(0) from user where bornDate is null")
	public Integer selectUserCountToUnknow();
	
	@Select("select userId,username from user where userId = #{id}")
	public User selectForArticle(@Param("id") int id);
	
	@Select("select count(1) from user_follow where userId = #{userId} and followedId =#{followedId} limit 1;")
	public boolean isFollowed(@Param("userId") int userId,@Param("followedId") int followedId);
	
	

}
