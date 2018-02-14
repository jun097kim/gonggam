package kim.jun0.gonggam.mapper;

import kim.jun0.gonggam.domain.UserVo;

public interface UserGroupMapper {

	public void create(UserVo vo) throws Exception;
	public void delete(String userId) throws Exception;
}
