package kim.jun0.gonggam.mapper;

import java.util.List;

import kim.jun0.gonggam.domain.UserVO;
import kim.jun0.gonggam.dto.LoginDTO;

public interface UserMapper {

	public UserVO login(LoginDTO dto);
	
	public void addUser(UserVO vo);
	
	public List<UserVO> listAll();
}
