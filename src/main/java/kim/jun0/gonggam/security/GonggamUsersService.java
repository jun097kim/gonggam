package kim.jun0.gonggam.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.mapper.UserMapper;
import lombok.extern.java.Log;

@Service
@Log
public class GonggamUsersService implements UserDetailsService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return new GonggamSecurityUser(mapper.findUserByUsername(username));
	}
}
