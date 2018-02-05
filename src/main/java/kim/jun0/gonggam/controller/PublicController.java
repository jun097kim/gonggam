package kim.jun0.gonggam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kim.jun0.gonggam.service.MenuService;
import lombok.extern.java.Log;


@Controller
@Log
public class PublicController {
	
	@Autowired
	MenuService service ;

	@GetMapping("/")
	public String viewIndex() {
		return "/index";
	}
	
	@RequestMapping(value = "/api/public/menus", produces = "application/xml")
	@ResponseBody
	public ResponseEntity<String> listPublicMenu() {
		
		ResponseEntity<String> entity = null;
		
		try {
			String menus = service.listPublicMenu();
			entity = new ResponseEntity<>(menus, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
