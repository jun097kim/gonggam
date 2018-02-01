package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kim.jun0.gonggam.annotation.ActiveUser;
import kim.jun0.gonggam.domain.CodegroupVo;
import kim.jun0.gonggam.mapper.CodegroupMapper;
import lombok.extern.java.Log;

@Service
@Log
public class CodegroupServiceImpl implements CodegroupService {
	
	@Autowired
	private CodegroupMapper mapper;
	
	@Override
	public List<CodegroupVo> listCodegroup() throws Exception {
		return mapper.list();
	}

	@Override
	public void createCodegroup(@ActiveUser String userId, CodegroupVo vo) throws Exception {
		vo.setRegUserId(userId);
		mapper.create(vo);
	}

	@Transactional
	@Override
	public void updateCodegroup(@ActiveUser String userId, CodegroupVo vo) throws Exception {
		vo.setUpdateUserId(userId);
		mapper.update(vo);
	}
	
	@Override
	public int getChildCodeCnt(String codegroupId) throws Exception {
		return mapper.getChildCodeCnt(codegroupId);
	}
	
	@Override
	public void deleteCodegroup(String codegroupId) throws Exception {
		mapper.delete(codegroupId);
	}
}
