package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MsgAdminDao;
import dao.MsgDao;
import model.Msg;

@Service
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDao msgDao;
	@Autowired
	private MsgAdminDao msgAdminDao;
	@Override
	public boolean sendMsg(Msg msg) {
		// TODO Auto-generated method stub
		msgAdminDao.insertMsgAdimin(msg);
		msgDao.insertMsg(msg);
		
		return true;
	}
	@Override
	public boolean deleteMsg(int msg_no) {
		// TODO Auto-generated method stub
		msgDao.deleteMsg(msg_no);
		return true;
	}
	@Override
	public Msg showMsg(int msg_no) {
		// TODO Auto-generated method stub
		return msgDao.selectOneMsg(msg_no);
	}
	@Override
	public List<Msg> showMsgList(String msg_ReceiverId) {
		// TODO Auto-generated method stub
		return msgDao.selectMsgAll(msg_ReceiverId);
	}
	@Override
	public boolean deleteMsgAdmin(int msg_no) {
		// TODO Auto-generated method stub
		msgAdminDao.deleteMsgAdimin(msg_no);
		return true;
	}
	@Override
	public Msg showMsgAdmin(int msg_no) {
		// TODO Auto-generated method stub
		return msgAdminDao.selectOneMsgAdimin(msg_no);
	}
	@Override
	public List<Msg> showMsgListAdmin(String msg_ReceiverId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String,Object>();
		param.put("msg_ReceiverId", msg_ReceiverId);
		return msgAdminDao.selectMsgAllAdimin(param);
	}
	@Override
	public int getStartPage(int page) {
		// TODO Auto-generated method stub
		return (page - 1) / 10 * 10 + 1;
	}
	@Override
	public int getEndPage(int page) {
		// TODO Auto-generated method stub
		return (page-1)/10 * 10+10;
	}
	@Override
	public int getSkip(int page) {
		// TODO Auto-generated method stub
		return (page - 1) * 10;
	}
	//고침?????
	@Override
	public int getMsgAdminLastPage(String msg_ReceiverId) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String,Object>();
		param.put("msg_ReceiverId", msg_ReceiverId);
		return (msgAdminDao.selectMsgAllAdimin(param).size() - 1 ) / 10 + 1;
	}
	@Override
	public int getMsgLastPage(String msg_ReceiverId) {
		// TODO Auto-generated method stub
		return (msgDao.selectMsgAll(msg_ReceiverId).size() - 1 ) / 10 + 1;
	}
	
	
}
