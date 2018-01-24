package kim.jun0.gonggam;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kim.jun0.gonggam.domain.UserVo;
import kim.jun0.gonggam.dto.LoginDto;
import kim.jun0.gonggam.mapper.UserMapper;

public class UserMapperTest extends GonggamApplicationTests {

	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testLogin() throws Exception {
		LoginDto dto = new LoginDto();
		dto.setUserId("user00");
		dto.setUserPw("user00");
		
		UserVo vo = mapper.login(dto);
		System.out.println(vo);
	}
}
