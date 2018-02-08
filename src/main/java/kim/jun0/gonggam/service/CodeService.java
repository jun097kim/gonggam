package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;

import kim.jun0.gonggam.domain.CodeVo;

public interface CodeService {

	public List<CodeVo> listCode(String codegroupId) throws Exception;
	
	public void createCode(@AuthenticationPrincipal UserDetails activeUser, CodeVo vo) throws Exception;
	
	public void updateCode(@AuthenticationPrincipal UserDetails activeUser, CodeVo vo) throws Exception;
	
	public void deleteCode(String codeId) throws Exception;
}
