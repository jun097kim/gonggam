package kim.jun0.gonggam.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import kim.jun0.gonggam.domain.UrlVo;
import kim.jun0.gonggam.mapper.UrlMapper;

@Component
public class GonggamFilterSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	
	private static final String ROLE_PREFIX = "ROLE_";
	
	@Autowired
	private UrlMapper mapper;
	
	private List<UrlVo> roles;
	
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		FilterInvocation fi = (FilterInvocation) object;
		String url = fi.getRequestUrl();
		
		if (roles == null) {
			try {
				roles = mapper.list();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		List<ConfigAttribute> attrs = new ArrayList<>();
		
		AntPathMatcher matchers = new AntPathMatcher();
		roles.forEach(role -> {
			if (matchers.match(role.getUrl(), url)) {
				role.getGroupName().forEach(groupName -> {
					attrs.add(new SecurityConfig(ROLE_PREFIX + groupName));
				});
			}
		});
		
		return attrs;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
	}
	
	public void refreshDatasource() {
		roles = null;
	}
}
