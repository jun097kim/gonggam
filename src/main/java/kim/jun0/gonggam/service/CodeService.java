package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.domain.CodeVo;

public interface CodeService {

	public List<CodeVo> listCode(String codegroupId) throws Exception;
	
	public void createCode(String loginId, CodeVo vo) throws Exception;
	
	public void updateCode(String loginId, CodeVo vo) throws Exception;
	
	public void deleteCode(String codeId) throws Exception;
}
