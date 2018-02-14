package kim.jun0.gonggam.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.vote.AffirmativeBased;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;

import kim.jun0.gonggam.security.GonggamFilterSecurityMetadataSource;
import kim.jun0.gonggam.security.GonggamUsersService;
import kim.jun0.gonggam.security.GonggamVoter;
import lombok.extern.java.Log;

@Log
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	GonggamUsersService gonggamUsersService;
	
	@Autowired
	GonggamFilterSecurityMetadataSource metadataSource;
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.formLogin()
				.loginPage("/auth/login")
				.and()
			.logout()
				.logoutUrl("/auth/logout")
				.logoutSuccessUrl("/")
				.and()
			.exceptionHandling().accessDeniedPage("/accessDenied")
				.and()
			.addFilterAfter(filterSecurityInterceptor(), FilterSecurityInterceptor.class);
	}
	
	public FilterSecurityInterceptor filterSecurityInterceptor() {
		
		FilterSecurityInterceptor interceptor = new FilterSecurityInterceptor();
		interceptor.setSecurityMetadataSource(metadataSource);
		interceptor.setAuthenticationManager(authenticationManager);
		interceptor.setAccessDecisionManager(affirmativeBased());
		return interceptor;
	}
	
	private AffirmativeBased affirmativeBased() {
		
		List<AccessDecisionVoter<?>> voters = new ArrayList<>();
		voters.add(new GonggamVoter());
		return new AffirmativeBased(voters);
	}
}
