package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;

import kim.jun0.gonggam.domain.CodegroupVo;

public interface CodegroupService {

	public List<CodegroupVo> listCodegroup() throws Exception;
	
	public void createCodegroup(@AuthenticationPrincipal UserDetails activeUser, CodegroupVo vo) throws Exception;
	
	public void updateCodegroup(@AuthenticationPrincipal UserDetails activeUser, CodegroupVo vo) throws Exception;

	public int getChildCodeCnt(String codegroupId) throws Exception;

	public void deleteCodegroup(String codegroupId) throws Exception;
}
