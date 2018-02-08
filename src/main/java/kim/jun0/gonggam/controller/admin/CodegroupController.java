package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kim.jun0.gonggam.domain.CodegroupVo;
import kim.jun0.gonggam.exception.ChildRecordFoundException;
import kim.jun0.gonggam.service.CodegroupService;
import lombok.extern.java.Log;

@RestController
@RequestMapping("/api/codegroups")
@Log
public class CodegroupController {
	
	@Autowired
	private CodegroupService service;

	@GetMapping("")
	public ResponseEntity<List<CodegroupVo>> listCodegroup() {
		
		ResponseEntity<List<CodegroupVo>> entity = null;
		
		try {
			List<CodegroupVo> codegroups = service.listCodegroup();
			entity = new ResponseEntity<>(codegroups, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> createCodegroup(@AuthenticationPrincipal UserDetails activeUser,
			@RequestBody CodegroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.createCodegroup(activeUser, vo);
			msg = "코드그룹이 성공적으로 등록되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "코드그룹 등록에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping
	public ResponseEntity<String> updateCodegroup(@AuthenticationPrincipal UserDetails activeUser,
			@RequestBody CodegroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.updateCodegroup(activeUser, vo);
			msg = "코드그룹이 성공적으로 수정되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "코드그룹 수정에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> deleteCodegroup(@RequestBody CodegroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			int childCodeCnt = service.getChildCodeCnt(vo.getCodegroupId());
			if (childCodeCnt > 0) {
				throw new ChildRecordFoundException();
			}
			
			service.deleteCodegroup(vo.getCodegroupId());
			msg = "코드그룹이 정상적으로 삭제되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch(ChildRecordFoundException e) {
			msg = "공통코드를 가진 코드그룹은 삭제할 수 없습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "코드그룹 삭제에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
