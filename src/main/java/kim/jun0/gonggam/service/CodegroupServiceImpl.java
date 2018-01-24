package kim.jun0.gonggam.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.annotation.ActiveUser;
import kim.jun0.gonggam.domain.CodegroupVo;
import kim.jun0.gonggam.mapper.CodegroupMapper;

@Service
public class CodegroupServiceImpl implements CodegroupService {

	private static final Logger logger = LoggerFactory.getLogger(CodegroupService.class);
	
	@Autowired
	private CodegroupMapper mapper;
	
	@Override
	public List<CodegroupVo> listCodegroup() throws Exception {
		return mapper.list();
	}

	@Override
	public void createCodegroup(@ActiveUser String userId, CodegroupVo vo) throws Exception {
		
		vo.setRegUserId(userId);
		
		String codegroupId = vo.getCodegroupId();
		vo.setCodegroupId(codegroupId.toUpperCase());

		mapper.create(vo);
	}

	@Override
	public void updateCodegroup(@ActiveUser String userId, CodegroupVo vo) throws Exception {
		
		logger.info(vo.toString());
		vo.setUpdateUserId(userId);

		String codegroupId = vo.getCodegroupId();
		vo.setCodegroupId(codegroupId.toUpperCase());
		
		mapper.update(vo);
		
	}

	@Override
	public void deleteCodegroup(String codegroupId) throws Exception {
		mapper.delete(codegroupId);
	}
}
