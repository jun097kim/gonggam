package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.annotation.ActiveUser;
import kim.jun0.gonggam.domain.CodegroupVo;

public interface CodegroupService {

	public List<CodegroupVo> listCodegroup() throws Exception;
	
	public void createCodegroup(@ActiveUser String userId, CodegroupVo vo) throws Exception;
	
	public void updateCodegroup(@ActiveUser String userId, CodegroupVo vo) throws Exception;

	public int getChildCodeCnt(String codegroupId) throws Exception;

	public void deleteCodegroup(String codegroupId) throws Exception;
}
