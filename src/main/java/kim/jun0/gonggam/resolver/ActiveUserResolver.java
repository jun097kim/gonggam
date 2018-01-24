package kim.jun0.gonggam.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kim.jun0.gonggam.annotation.ActiveUser;
import kim.jun0.gonggam.domain.UserVo;

public class ActiveUserResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.hasParameterAnnotation(ActiveUser.class);
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		UserVo vo = (UserVo) webRequest.getAttribute("login", NativeWebRequest.SCOPE_SESSION);
		return vo.getUserId();
	}

}
