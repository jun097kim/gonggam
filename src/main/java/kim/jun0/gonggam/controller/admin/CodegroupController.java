package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import kim.jun0.gonggam.annotation.ActiveUser;
import kim.jun0.gonggam.domain.CodegroupVo;
import kim.jun0.gonggam.service.CodegroupService;

@RestController
@RequestMapping("/api/codegroups")
public class CodegroupController {

	private static final Logger logger = LoggerFactory.getLogger(CodegroupController.class);
	
	@Autowired
	private CodegroupService service;

	@GetMapping("")
	public ResponseEntity<List<CodegroupVo>> listCodegroup() {
		
		ResponseEntity<List<CodegroupVo>> entity = null;
		
		try {
			List<CodegroupVo> list = service.listCodegroup();
			entity = new ResponseEntity<>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> createCodegroup(@ActiveUser String loginId, @RequestBody CodegroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.createCodegroup(loginId, vo);
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
	public ResponseEntity<String> updateCodegroup(@ActiveUser String loginId, @RequestBody CodegroupVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.updateCodegroup(loginId, vo);
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
			service.deleteCodegroup(vo.getCodegroupId());
			msg = "코드그룹이 정상적으로 삭제되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "코드그룹 삭제에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
