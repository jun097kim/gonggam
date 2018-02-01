package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.domain.CodeVo;
import kim.jun0.gonggam.mapper.CodeMapper;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeMapper mapper;
	
	@Override
	public List<CodeVo> listCode(String codegroupId) throws Exception {
		return mapper.list(codegroupId);
	}
	
	@Override
	public void createCode(String loginId, CodeVo vo) throws Exception {
		vo.setRegUserId(loginId);
		mapper.create(vo);
	}
	
	@Override
	public void updateCode(String loginId, CodeVo vo) throws Exception {
		vo.setUpdateUserId(loginId);
		mapper.update(vo);
	}
	
	@Override
	public void deleteCode(String codeId) throws Exception {
		mapper.delete(codeId);
	}
}
