package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OftenQnAController {
	
	
	@RequestMapping("gg.oqc")
	public String gg(@RequestParam int a) {
		System.out.println("왔다");
		System.out.println(a);
		return "iii";
	}
	@RequestMapping("fgg.oqc")
	public void gg() {
	
	}
}
