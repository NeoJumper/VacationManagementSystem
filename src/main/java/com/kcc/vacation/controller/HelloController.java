package com.kcc.vacation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	@GetMapping("/index")
	public String index(Model model) {
		model.addAttribute("test", "test");
		return "index";
	}

	@GetMapping("/client/request-vacation")
	public String requestVacation() {
		return "client/request-vacation";
	}

	@GetMapping("/auth/signup")
	public String signup() {
		return "auth/signup";
	}
	@GetMapping("/auth/login")
	public String login() {
		return "auth/login";
	}
	@GetMapping("/organizational-management")
	public String organizationalManagement() {
		return "admin/organizational-management";
	}


	
	@GetMapping("/admin/vacation-type-management")
	public String vacationTypeManagement() {
    return "admin/vacation-type-management";
  }

	@GetMapping("/resources/components/admin/addVacationTypeModal")
	public String addVacationTypeModal() {
    return "resources/components/admin/addVacationTypeModal";
  }

	@GetMapping("/admin/grant-vacation-management")
	public String vacationGrantManagement() {
    return "admin/grant-vacation-management";
  }
		
}
