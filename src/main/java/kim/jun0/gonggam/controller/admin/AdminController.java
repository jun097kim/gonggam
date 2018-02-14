package kim.jun0.gonggam.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kim.jun0.gonggam.mapper.GroupMapper;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	GroupMapper groupMapper;
	
	@RequestMapping("")
	public String viewIndex() {
		return "redirect:/admin/user";
	}
	
	@GetMapping("/user")
	public void viewUserIndex(Model model) throws Exception {
		model.addAttribute("groups", groupMapper.list());
	}
	
	@GetMapping("/group")
	public void viewGroupIndex() throws Exception {
		
	}
	
	@GetMapping("/role")
	public void viewRoleIndex(Model model) throws Exception {
		model.addAttribute("groups", groupMapper.list());
	}
	
	@GetMapping("/code")
	public void viewCodeIndex() throws Exception {
		
	}

	@GetMapping("/menu")
	public void viewMenuIndex() throws Exception {
		
	}
}
