package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kim.jun0.gonggam.domain.UserVo;
import kim.jun0.gonggam.service.UserService;

@RestController
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("")
	public ResponseEntity<List<UserVo>> listUser(Model model) {
		
		ResponseEntity<List<UserVo>> entity = null;
		
		try {
			List<UserVo> list = service.listUser();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<UserVo> createUser(@RequestBody UserVo vo) {
		
		ResponseEntity<UserVo> entity = null;
		
		try {
			service.createUser(vo);
			entity = new ResponseEntity<>(vo, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
