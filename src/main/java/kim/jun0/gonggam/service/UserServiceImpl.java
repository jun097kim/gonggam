package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.domain.UserVo;
import kim.jun0.gonggam.dto.LoginDto;
import kim.jun0.gonggam.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Override
	public List<UserVo> listUser() throws Exception {
		return mapper.list();
	}

	@Override
	public void createUser(UserVo vo) throws Exception {
		mapper.create(vo);
	}
	
	@Override
	public void updateUser(UserVo vo) throws Exception {
		mapper.update(vo);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		mapper.delete(userId);
	}
	
	@Override
	public UserVo login(LoginDto dto) throws Exception {
		return mapper.login(dto);
	}
}
