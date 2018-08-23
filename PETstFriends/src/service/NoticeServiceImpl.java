package service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.NoticeDao;
import model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeDao nDao;

	@Override
	public HashMap<String, Object> showNoticeList(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int page = (int) params.get("page");
		int numb = (int) params.get("numb");
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("current",page);
		result.put("start", getStartPage(page, numb));
		if(getEndPage(page, numb) > getLastPage(params))
			result.put("end", getLastPage(params));
		else
			result.put("end", getEndPage(page, numb));
		result.put("last", getLastPage(params));
		params.put("skip", getSkip(page, numb));
		result.put("noticeList", nDao.selectBoardPage(params));
		return result;

	}
	@Override
	public int getStartPage(int page, int numb) { //시작페이지
		return (page- 1) / numb * numb + 1;
	}
	@Override
	public int getEndPage(int page, int numb) { //10단위로
		return ((page-1) / numb + 1) * numb;
	}
	@Override
	public int getLastPage(HashMap<String, Object> params) {//목록의 끝 번호
		int numb = (int) params.get("numb");
		return (nDao.getCount(params) - 1 ) / numb + 1;
	}
	@Override
	public int getSkip(int page, int numb) {//앞에 지나간 갯수
		return (page - 1) * numb;
	}
	@Override
	public Notice showNoticeBoard(int notice_boardno) {
		// TODO Auto-generated method stub
		Notice notice = nDao.selectOneBoard(notice_boardno);
		notice.setNotice_readCount(notice.getNotice_readCount()+1);
		nDao.updateBoard(notice);
		return notice;
	}
	@Override
	public int writeNoticeBoard(Notice notice) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
		String notice_writeDate = simple.format(new Date());
		notice.setNotice_writeDate(notice_writeDate);
		notice.setNotice_readCount(0);
		return nDao.insertBoard(notice);
	}
	@Override
	public int deleteNoticeBoard(int notice_boardno) {
		// TODO Auto-generated method stub
		return nDao.deleteBoard(notice_boardno);
	}
	@Override
	public Notice getNoticeBoard(int notice_boardno) {
		// TODO Auto-generated method stub
		System.out.println("ddd");
		return nDao.selectOneBoard(notice_boardno);
	}
	@Override
	public int modifyBoard(HashMap<String, Object> params) {
		// TODO Auto-generated method stu
		Notice notice = new Notice();
		notice.setNotice_adminId((String) params.get("notice_adminId"));
		notice.setNotice_boardno(Integer.parseInt((String)params.get("notice_boardno")));
		notice.setNotice_content((String) params.get("notice_content"));
		notice.setNotice_contentPic((String) params.get("notice_contentPic"));
		notice.setNotice_title((String) params.get("notice_contentPic"));
		return nDao.updateBoard(notice);
	}

}
