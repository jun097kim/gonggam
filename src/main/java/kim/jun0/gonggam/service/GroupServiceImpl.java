package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.domain.GroupVo;
import kim.jun0.gonggam.mapper.GroupMapper;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupMapper mapper;
	
	@Override
	public List<GroupVo> listGroup() throws Exception {
		return mapper.list();
	}
	
	@Override
	public void createGroup(GroupVo vo) throws Exception {
		mapper.create(vo);
	}
	
	@Override
	public void updateGroup(GroupVo vo) throws Exception {
		mapper.update(vo);
	}
	
	@Override
	public void deleteGroup(int groupNo) throws Exception {
		mapper.delete(groupNo);
	}
}
