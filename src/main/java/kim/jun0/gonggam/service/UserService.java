package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.domain.UserVO;
import kim.jun0.gonggam.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto);
	
	public void addUser(UserVO vo);
	
	public List<UserVO> listAll();
	
}
