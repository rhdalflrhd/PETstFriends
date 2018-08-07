package model;

import java.util.Date;

public class Msg {
	int msg_no;
	String msg_ReceiverId;
	String msg_title;
	String msg_contents;
	Date msg_sendDate;
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_ReceiverId() {
		return msg_ReceiverId;
	}
	public void setMsg_ReceiverId(String msg_ReceiverId) {
		this.msg_ReceiverId = msg_ReceiverId;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_contents() {
		return msg_contents;
	}
	public void setMsg_contents(String msg_contents) {
		this.msg_contents = msg_contents;
	}
	public Date getMsg_sendDate() {
		return msg_sendDate;
	}
	public void setMsg_sendDate(Date msg_sendDate) {
		this.msg_sendDate = msg_sendDate;
	}
	@Override
	public String toString() {
		return "msg [msg_no=" + msg_no + ", msg_ReceiverId=" + msg_ReceiverId + ", msg_title=" + msg_title
				+ ", msg_contents=" + msg_contents + ", msg_sendDate=" + msg_sendDate + "]";
	}

}
