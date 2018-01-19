package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.domain.UserVO;
import kim.jun0.gonggam.dto.LoginDTO;
import kim.jun0.gonggam.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Override
	public UserVO login(LoginDTO dto) {
		return mapper.login(dto);
	}
	
	@Override
	public void addUser(UserVO vo) {
		mapper.addUser(vo);
	}

	@Override
	public List<UserVO> listAll() {
		return mapper.listAll();
	}

}
