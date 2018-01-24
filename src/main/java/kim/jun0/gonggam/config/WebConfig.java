package kim.jun0.gonggam.config;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import kim.jun0.gonggam.interceptor.AuthInterceptor;
import kim.jun0.gonggam.interceptor.LoginInterceptor;
import kim.jun0.gonggam.resolver.ActiveUserResolver;

@Configuration
@MapperScan(value = {"kim.jun0.gonggam.mapper"})
public class WebConfig extends WebMvcConfigurerAdapter {

	@Autowired
	LoginInterceptor loginInterceptor;

	@Autowired
	AuthInterceptor authInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor)
			.addPathPatterns("/auth/login")
			.addPathPatterns("/auth/loginPost");
		
		registry.addInterceptor(authInterceptor)
			.addPathPatterns("/admin/**");
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(new ActiveUserResolver());
	}
}
