package kim.jun0.gonggam.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
@MapperScan(value = {"kim.jun0.gonggam.mapper"})
public class WebConfig extends WebMvcConfigurerAdapter {
	
}
