package joeson.com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import joeson.com.bean.Article;
import joeson.com.bean.User;
import joeson.com.inter.BaseMapper;

public interface ArticleMapper extends BaseMapper{
	
	@Insert("insert into article(title,userId) values("
			+ "#{title},"
			+ "#{userId})")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
	public int add(Article article);
	
	@Update("update article set imagePath = #{imagePath} where id = #{id}")
	public void updateArticleImageById(@Param("id") int id,@Param("imagePath") String imagePath);
	
	@Update("update article set title = #{title},content = #{content} where id = #{id}")
	public void updateArticle(Article article);
	
	@Update("update article set gist=#{gist},"
			+ "report = #{report},"
			+ "countryCode = #{countryCode},"
			+ "provinceCode = #{provinceCode},"
			+ "cityCode = #{cityCode} where id = #{id}")
	public void updateReport(Article article);
	
	@Select("select A.id,A.title,A.content,A.likeNumber,A.viewNumber,A.createTime,B.username from article A left join user B on A.userId = B.userId where A.userId = #{userId} order by id desc")
	public List<Article> selectList(@Param("userId") int userId);
	
	@Select("select A.id,A.title,A.content,A.likeNumber,A.viewNumber,A.createTime,B.username from article A left join user B on A.userId = B.userId where A.userId = #{userId} order by id desc limit 0,1 ")
	public Article selectLimitOneByUserId(@Param("userId") int userId);
	
	
	@Select("select * from article where id = #{id}")
	public Article selectById(int id);
	
	@Select("select id,title,content from article where userId = #{userId} limit #{fristNum},#{lastNum}")
	public List<Article> selectByUserId(@Param("userId") int userId,@Param("fristNum") int fristNum,@Param("lastNum") int lastNum);

	@Select("CALL computeHot")
	public List<Map<Long, Object>> selectComputeHot();
	
	@Select("select id,title,hotPoint,userId from article order by hotPoint desc limit 0,5")
	@Results({
		@Result(column="id",property="id",id=true),
		@Result(column="title",property="title"),
		@Result(column="hotPoint",property="hotPoint"),
		@Result(column="userId",property="user",one=@One(select="joeson.com.mapper.UserMapper.selectForArticle"))
	})
	public List<Article> selectArticlesByHot();
	
}
