package kim.jun0.gonggam.mapper;

import java.util.List;

import kim.jun0.gonggam.domain.GroupVo;

public interface GroupMapper {

	public List<GroupVo> list() throws Exception;
	
	public void create(GroupVo vo) throws Exception;
	
	public void update(GroupVo vo) throws Exception;
	
	public void delete(int groupNo) throws Exception;
}
