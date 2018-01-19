package kim.jun0.gonggam.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kim.jun0.gonggam.domain.UserVO;
import kim.jun0.gonggam.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping("")
	public String viewIndex() {
		return "redirect:/admin/user";
	}
	
	@GetMapping("/user")
	public void user(Model model) {
		List<UserVO> list = service.listAll();
		model.addAttribute("list", list);
	}
	
	@PostMapping("/user")
	public void addUser(UserVO vo) {
		service.addUser(vo);
	}
}
