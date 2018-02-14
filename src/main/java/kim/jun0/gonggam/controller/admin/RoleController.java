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

import kim.jun0.gonggam.domain.UrlVo;
import kim.jun0.gonggam.service.UrlService;
import lombok.extern.java.Log;

@RestController
@RequestMapping("/api/roles")
@Log
public class RoleController {

	@Autowired
	private UrlService service;
	
	@GetMapping("")
	public ResponseEntity<List<UrlVo>> listUrl() {
		
		ResponseEntity<List<UrlVo>> entity = null;
		
		try {
			List<UrlVo> urls = service.listUrl();
			entity = new ResponseEntity<>(urls, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("")
	public ResponseEntity<String> createUrl(@RequestBody UrlVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.createUrl(vo);
			msg = "URL이 성공적으로 추가되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "URL 추가에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("")
	public ResponseEntity<String> updateUrl(@RequestBody UrlVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.updateUrl(vo);
			msg = "URL을 성공적으로 수정하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "URL 수정에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> deleteUrl(@RequestBody UrlVo vo) {
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.deleteUrl(vo.getOld_url());
			msg = "URL을 성공적으로 삭제하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "URL 삭제에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
