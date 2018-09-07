package dao;

import java.util.List;

import model.Msg;

public interface MsgDao {
	public boolean insertMsg(Msg msg);
	public boolean deleteMsg(int msg_no);
	public Msg selectOneMsg(int msg_no);
	public List<Msg> selectMsgAll(String msg_ReceiverId);

}
