package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

	@RequestMapping("gg.nc")
	public String gg(@RequestParam int a) {
		System.out.println("왔다");
		System.out.println(a);
		return "ii";
	}
	@RequestMapping("fg.nc")
	public void gg() {
	
	}
	
}
