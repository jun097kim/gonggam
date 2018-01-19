package kim.jun0.gonggam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kim.jun0.gonggam.domain.UserVO;
import kim.jun0.gonggam.dto.LoginDTO;
import kim.jun0.gonggam.service.UserService;

@Controller
@RequestMapping("/auth")
public class LoginController {

	@Autowired
	private UserService service;
	
	@GetMapping("/login")
	public void loginGET() {
		
	}
	
	@PostMapping("/loginPost")
	public void loginPOST(LoginDTO dto, Model model) {
		UserVO vo = service.login(dto);
		
		if (vo != null) {
			model.addAttribute("userVO", vo);
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		Object obj = session.getAttribute("login");
		
		if (obj != null) {
			session.removeAttribute("login");
			session.invalidate();
		}
		
		return "redirect:/";
	}
}
