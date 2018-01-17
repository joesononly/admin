package joeson.com.config;

import joeson.com.interceptor.UserLoginInterceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @创建人 zjh
 * @创建时间 2017-12-34
 * @描述 注册用户登录拦截器
 * */
@Configuration
public class TravelWebAppConfig extends WebMvcConfigurerAdapter {
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new UserLoginInterceptor()).addPathPatterns("/user/**");
		super.addInterceptors(registry);
	}

}
