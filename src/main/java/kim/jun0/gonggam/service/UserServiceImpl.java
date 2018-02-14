package kim.jun0.gonggam.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.domain.UserVo;
import kim.jun0.gonggam.mapper.UserGroupMapper;
import kim.jun0.gonggam.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserGroupMapper userGroupMapper;
	
	@Autowired
	private PasswordEncoder pwEncoder;

	@Override
	public List<UserVo> listUser() throws Exception {
		return userMapper.list();
	}

	@Transactional
	@Override
	public void createUser(UserVo vo) throws Exception {
		
		String encryptPw = pwEncoder.encode(vo.getUserPw());
		vo.setUserPw(encryptPw);
		
		userMapper.create(vo);
		if (vo.getGroupNames().size() > 0) {
			userGroupMapper.create(vo);
		}
	}
	
	@Transactional
	@Override
	public void updateUser(UserVo vo) throws Exception {
		
		String encryptPw = pwEncoder.encode(vo.getUserPw());
		vo.setUserPw(encryptPw);
		
		userMapper.update(vo);
		userGroupMapper.delete(vo.getUserId());
		if (vo.getGroupNames().size() > 0) {
			userGroupMapper.create(vo);
		}
	}

	@Transactional
	@Override
	public void deleteUser(String userId) throws Exception {
		userGroupMapper.delete(userId);
		userMapper.delete(userId);
	}
}
