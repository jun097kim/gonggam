package kim.jun0.gonggam.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("")
	public String viewIndex() {
		return "redirect:/admin/user";
	}
	
	@GetMapping("/user")
	public String viewUserIndex() throws Exception {
		return "/admin/user/index";
	}
	
	@GetMapping("/user/group")
	public void viewUserGroup() throws Exception {
		
	}
	
	@GetMapping("/code")
	public String viewCodeIndex() throws Exception {
		return "/admin/code/index";
	}
}
