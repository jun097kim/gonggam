package kim.jun0.gonggam.security;

import java.util.Collection;

import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.FilterInvocation;

public class GonggamVoter implements AccessDecisionVoter<FilterInvocation> {

	@Override
	public boolean supports(ConfigAttribute attribute) {
		return attribute instanceof SecurityConfig;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz != null && clazz.isAssignableFrom(FilterInvocation.class);
	}

	@Override
	public int vote(Authentication authentication, FilterInvocation object, Collection<ConfigAttribute> attributes) {
		
		SecurityConfig config = null;
		
		boolean granted = false;
		for (ConfigAttribute attribute : attributes) {
			config = (SecurityConfig) attribute;
			
			for (GrantedAuthority authority : authentication.getAuthorities()) {
				if (authority.getAuthority().equals(config.getAttribute())) {
					granted = true;
					break;
				}
			}
		}
		
		return granted ? ACCESS_GRANTED : ACCESS_DENIED;
	}

}
