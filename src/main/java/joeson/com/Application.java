package joeson.com;

import joeson.com.resovler.CustomMultipartResolver;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.MultipartAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.multipart.MultipartResolver;

@EnableEurekaClient
@EnableAutoConfiguration(exclude = {MultipartAutoConfiguration.class})
@EnableScheduling  
@SpringBootApplication
@MapperScan("joeson.com.mapper")
public class Application {

	
	/*
	 * 将 multipartResolver 指向我们刚刚创建好的继承 CommonsMultipartResolver 类的自定义文件上传处理类
	 */
	@Bean(name = "multipartResolver")
	public MultipartResolver multipartResolver() {
	    CustomMultipartResolver customMultipartResolver = new CustomMultipartResolver();
	    return customMultipartResolver;
	}
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
