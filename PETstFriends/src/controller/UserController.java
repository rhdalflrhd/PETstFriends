package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.UserService;
import service.UserServiceImpl;

@Controller
public class UserController {
	
	
	@Autowired
	UserServiceImpl userService;
}

	


