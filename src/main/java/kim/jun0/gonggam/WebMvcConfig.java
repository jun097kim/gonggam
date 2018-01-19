package kim.jun0.gonggam;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import kim.jun0.gonggam.interceptor.AuthInterceptor;
import kim.jun0.gonggam.interceptor.LoginInterceptor;

@Configuration
@MapperScan(value = {"kim.jun0.gonggam.mapper"})
public class WebMvcConfig extends WebMvcConfigurerAdapter {

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
			.addPathPatterns("/admin/*");
	}
}
