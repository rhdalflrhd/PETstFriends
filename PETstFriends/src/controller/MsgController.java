package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Msg;
import service.MsgServiceImpl;

@Controller
public class MsgController {
	
	@Autowired
	private MsgServiceImpl msgServiceImpl;
	
	@RequestMapping("msgAdmin.do")
	public String meeting() {
		return "msg/msgadmin";
	}
	@RequestMapping("sendMsg.do")
	@ResponseBody
	public String sendMsg(@RequestParam String msg_ReceiverId, @RequestParam String msg_title, @RequestParam String msg_contents) {
        SimpleDateFormat date1 = new SimpleDateFormat("yyyy MM dd HH:mm");
		Msg msg = new Msg();
		msg.setMsg_ReceiverId(msg_ReceiverId);
		msg.setMsg_title(msg_title);
		msg.setMsg_contents(msg_contents);
		msg.setMsg_sendDate(date1.format(new Date()));
		msgServiceImpl.sendMsg(msg);
		return "msg/msgadmin";
	}
	@RequestMapping("deleteMsg.do")
	public void deleteMsg(@RequestParam int msg_no) {
		msgServiceImpl.deleteMsg(msg_no);
	}
	@RequestMapping("showMsg.do")
	@ResponseBody
	public HashMap<String, Object> showMsg(@RequestParam int msg_no) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("showMsg", msgServiceImpl.showMsg(msg_no));
		JSONObject showMsg = new JSONObject(result);
		return showMsg;
	}
	@RequestMapping("showMsgList.do")
	@ResponseBody
	public HashMap<String, Object> showMsgList(@RequestParam String msg_ReceiverId) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("showMsgList", msgServiceImpl.showMsgList(msg_ReceiverId));
		JSONObject showMsgList = new JSONObject(result);
		return showMsgList;
	}
	@RequestMapping("deleteMsgAdimin.do")
	public String deleteMsgAdimin(@RequestParam int msg_no) {
		msgServiceImpl.deleteMsgAdmin(msg_no);
		return "redirect:msgAdmin.do";
	}
	
	@RequestMapping("showMsgAdimin.do")
	@ResponseBody
	public HashMap<String, Object> showMsgAdimin(@RequestParam int msg_no) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("showMsgAdmin", msgServiceImpl.showMsgAdmin(msg_no));
		JSONObject showMsgAdmin = new JSONObject(result);
		return showMsgAdmin;
	}
	@RequestMapping("showMsgListAdimin.do")
	@ResponseBody
	public HashMap<String, Object> showMsgListAdimin(Model model,@RequestParam(required = false) String msg_ReceiverId,
			@RequestParam(defaultValue = "1") int page) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("showMsgListAdmin", msgServiceImpl.showMsgListAdmin(msg_ReceiverId));
		result.put("current", page);
		result.put("start", msgServiceImpl.getStartPage(page));
		result.put("end", msgServiceImpl.getEndPage(page));
		result.put("last", msgServiceImpl.getMsgAdminLastPage());
		result.put("skip",msgServiceImpl.getSkip(page));
		JSONObject showMsgListAdmin = new JSONObject(result);
		return showMsgListAdmin;
	}

	
	
	
	

	
}
