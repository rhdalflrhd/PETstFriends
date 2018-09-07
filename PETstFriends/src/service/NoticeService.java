package service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import model.Notice;

public interface NoticeService {
	public HashMap<String, Object> showNoticeList(HashMap<String, Object> params);
	public int getStartPage(int page, int numb);
	public int getEndPage(int page, int numb);
	public int getLastPage(HashMap<String, Object> params);
	public int getSkip(int page, int numb);
	public Notice showNoticeBoard(int notice_boardno);
	public int writeNoticeBoard(Notice notice);
	public int deleteNoticeBoard(int notice_boardno);
	public Notice getNoticeBoard(int notice_boardno);
	public int modifyBoard(HashMap<String, Object> params);
}
