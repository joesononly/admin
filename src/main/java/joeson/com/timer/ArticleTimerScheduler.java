/**
 * 
 */
package joeson.com.timer;

import joeson.com.mapper.ArticleMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @创建人 zjh
 * @创建时间 2018年1月14日
 * @描述 每小时计算当天的文章热度，并存入数据库
 */
@Component
public class ArticleTimerScheduler {

	@Autowired
	ArticleMapper articleMapper;
	
	@Scheduled(cron="0 0 0/1 * * ?")
	public void computeArticleHotPint(){
		//热度计算公式   热度 = ((总收藏数+总赞数)*0.7+总评论数*0.3)*1000/(发布时间距离当前时间的小时差+2)^1.2
		articleMapper.selectComputeHot();	
	}
}
