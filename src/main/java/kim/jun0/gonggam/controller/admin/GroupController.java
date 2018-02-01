package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kim.jun0.gonggam.domain.GroupVo;
import kim.jun0.gonggam.service.GroupService;
import lombok.extern.java.Log;

@RestController
@RequestMapping("/api/groups")
@Log
public class GroupController {

	@Autowired
	private GroupService service;
	
	@GetMapping("")
	public ResponseEntity<List<GroupVo>> listGroup() {
		
		ResponseEntity<List<GroupVo>> entity = null;
		
		try {
			List<GroupVo> groups = service.listGroup();
			entity = new ResponseEntity<>(groups, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> createGroup(@RequestBody GroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.createGroup(vo);
			msg = "그룹이 성공적으로 추가되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "그룹 추가에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("")
	public ResponseEntity<String> updateGroup(@RequestBody GroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.updateGroup(vo);
			msg = "그릅이 성공적으로 수정되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "그룹 수정에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> deleteGroup(@RequestBody GroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.deleteGroup(vo.getGroupNo());
			msg = "그룹이 성공적으로 삭제되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "그룹 삭제에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
