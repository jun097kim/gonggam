package kim.jun0.gonggam;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kim.jun0.gonggam.domain.UserVO;
import kim.jun0.gonggam.dto.LoginDTO;
import kim.jun0.gonggam.mapper.UserMapper;

public class UserMapperTest extends GonggamApplicationTests {

	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testLogin() throws Exception {
		LoginDTO dto = new LoginDTO();
		dto.setUserid("user00");
		dto.setUserpw("user00");
		
		UserVO vo = mapper.login(dto);
		System.out.println(vo);
	}
}
