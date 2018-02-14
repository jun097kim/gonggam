package kim.jun0.gonggam.mapper;

import java.util.List;

import kim.jun0.gonggam.domain.UserVo;

public interface UserMapper {

	public List<UserVo> list() throws Exception;
	
	public void create(UserVo vo) throws Exception;
	
	public void update(UserVo vo) throws Exception;
	
	public void delete(String userId) throws Exception;
	
	public UserVo findUserByUsername(String username);
}
