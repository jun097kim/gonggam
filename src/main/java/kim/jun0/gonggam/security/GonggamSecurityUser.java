package kim.jun0.gonggam.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kim.jun0.gonggam.domain.UserVo;
import lombok.Getter;
import lombok.extern.java.Log;

@Getter
@Log
public class GonggamSecurityUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	private static final String ROLE_PREFIX = "ROLE_";
	
	private UserVo vo;

	public GonggamSecurityUser(UserVo vo) {
		super(vo.getUserId(), vo.getUserPw(), makeGrantedAuthority(vo.getGroupNames()));
		this.vo = vo;
	}
	
	private static List<GrantedAuthority> makeGrantedAuthority(List<String> groupNames) {
		List<GrantedAuthority> list = new ArrayList<>();
		
		groupNames.forEach(groupName -> {
			list.add(new SimpleGrantedAuthority(ROLE_PREFIX + groupName));
		});
		
		return list;
	}
}
