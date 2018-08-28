package controller;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;
import service.UserServiceImpl;

@Controller
public class UserController {
	
	
	@Autowired
	UserServiceImpl userService;
}

	


