package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	public ResponseEntity<String> createUser(@RequestBody UserVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.createUser(vo);
			msg = "사용자가 성공적으로 등록되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "사용자 등록에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("")
	public ResponseEntity<String> updateUser(@RequestBody UserVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null; 
		
		try {
			service.updateUser(vo);
			msg = "사용자가 성공적으로 수정되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "사용자 수정에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> deleteUser(@RequestBody UserVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.deleteUser(vo.getUserId());
			msg = "사용자가 성공적으로 삭제되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			msg = "사용자 삭제에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
