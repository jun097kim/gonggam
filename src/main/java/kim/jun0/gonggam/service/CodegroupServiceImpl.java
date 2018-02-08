package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void createCodegroup(@AuthenticationPrincipal UserDetails activeUser, CodegroupVo vo) throws Exception {
		vo.setRegUserId(activeUser.getUsername());
		mapper.create(vo);
	}

	@Transactional
	@Override
	public void updateCodegroup(@AuthenticationPrincipal UserDetails activeUser, CodegroupVo vo) throws Exception {
		vo.setUpdateUserId(activeUser.getUsername());
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
