package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.domain.UserVo;

public interface UserService {

	public List<UserVo> listUser() throws Exception;
	
	public void createUser(UserVo vo) throws Exception;
	
	public void updateUser(UserVo vo) throws Exception;
	
	public void deleteUser(String userId) throws Exception;
}
