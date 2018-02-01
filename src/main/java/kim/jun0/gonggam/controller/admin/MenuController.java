package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kim.jun0.gonggam.domain.MenuVo;
import kim.jun0.gonggam.dto.MenuDto;
import kim.jun0.gonggam.service.MenuService;
import lombok.extern.java.Log;

@RestController
@RequestMapping("/api/menus")
@Log
public class MenuController {

	@Autowired
	MenuService service;
	
	@GetMapping("")
	public ResponseEntity<List<MenuVo>> listMenu() {
		
		ResponseEntity<List<MenuVo>> entity = null;
		
		try {
			List<MenuVo> menus = service.listMenu();
			entity = new ResponseEntity<>(menus, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PutMapping("")
	public ResponseEntity<String> updateMenu(@RequestBody MenuDto dto) {

		ResponseEntity<String> entity = null;
		String msg = null;
		
		try {
			service.updateMenu(dto.getMenus(), dto.getDeleted());
			msg = "메뉴가 성공적으로 저장되었습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "메뉴 저장에 실패하였습니다.";
			entity = new ResponseEntity<>(msg, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
