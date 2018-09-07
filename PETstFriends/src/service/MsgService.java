package service;

import java.util.List;

import model.Msg;

public interface MsgService{
	public boolean sendMsg(Msg msg);
	public boolean deleteMsg(int msg_no);
	public Msg showMsg(int msg_no);
	public List<Msg> showMsgList(String msg_ReceiverId);
	
	
	public boolean deleteMsgAdmin(int msg_no);
	public Msg showMsgAdmin(int msg_no);
	public List<Msg> showMsgListAdmin(String msg_ReceiverId);
	
	public int getStartPage(int page);
	public int getEndPage(int page);
	public int getSkip(int page);
	public int getMsgAdminLastPage();
	public int getMsgLastPage(String msg_ReceiverId);
}
