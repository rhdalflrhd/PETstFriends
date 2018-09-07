package dao;

import java.util.HashMap;
import java.util.List;

import model.Msg;

public interface MsgAdminDao {
	public boolean insertMsgAdimin(Msg msg);
	public boolean deleteMsgAdimin(int msg_no);
	public Msg selectOneMsgAdimin(int msg_no);
	public List<Msg> selectMsgAllAdimin(HashMap<String, Object> param);
}
