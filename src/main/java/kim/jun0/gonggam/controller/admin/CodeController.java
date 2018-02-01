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

import kim.jun0.gonggam.annotation.ActiveUser;
import kim.jun0.gonggam.domain.CodeVo;
import kim.jun0.gonggam.service.CodeService;
import lombok.extern.java.Log;

@RestController
@RequestMapping("/api/codes")
@Log
public class CodeController {
	
	@Autowired
	private CodeService service;
	
	@GetMapping("")
	public ResponseEntity<List<CodeVo>> listCode(String codegroupId) {
		
		ResponseEntity<List<CodeVo>> entity = null;
		
		try {
			List<CodeVo> codes = service.listCode(codegroupId);
			entity = new ResponseEntity<>(codes, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> createCode(@ActiveUser String loginId, @RequestBody CodeVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.createCode(loginId, vo);
			msg = "공통코드가 성공적으로 추가되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "공통코드 추가에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("")
	public ResponseEntity<String> updateCode(@ActiveUser String loginId, @RequestBody CodeVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.updateCode(loginId, vo);
			msg = "공통코드가 성공적으로 수정되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "공통코드 수정에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> deleteCode(@RequestBody CodeVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.deleteCode(vo.getCodeId());
			msg = "공통코드가 성공적으로 삭제되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "공통코드 삭제에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
