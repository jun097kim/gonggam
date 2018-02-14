package kim.jun0.gonggam;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.junit4.SpringRunner;

import kim.jun0.gonggam.domain.UserVo;
import kim.jun0.gonggam.mapper.UserMapper;
import lombok.extern.java.Log;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log
@Commit
public class UserTests {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Transactional
	@Test
	public void testUpdatePlainPw() throws Exception {
		
		for (int i = 0; i <= 5; i++) {
			UserVo vo = mapper.findUserByUsername("user0" + i);
			
			String encryptPw = pwEncoder.encode(vo.getUserPw());
			vo.setUserPw(encryptPw);
			
			mapper.update(vo);
		}
	}
}
