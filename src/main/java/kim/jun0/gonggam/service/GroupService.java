package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.domain.GroupVo;

public interface GroupService {

	public List<GroupVo> listGroup() throws Exception;
	
	public void createGroup(GroupVo vo) throws Exception;
	
	public void updateGroup(GroupVo vo) throws Exception;
	
	public void deleteGroup(int groupNo) throws Exception;
}
