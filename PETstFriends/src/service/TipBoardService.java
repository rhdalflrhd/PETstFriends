package service;

import java.io.File;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import model.TipBoard;

public interface TipBoardService {
	
	public int writeTipBoardS(TipBoard dtBoard, MultipartFile TipBoard_contentPic);
	public int ModifyTipBoardS(TipBoard dtBoard);
	public int DeleteTipBoardS(int boardname, int boardno);
	
	public TipBoard ReadTipBoardS(int boardname, int boardno);

	public HashMap<String, Object> SearchTipBoardS(HashMap<String, Object> params, int Page);
	
	public int getStartPageS(int page);

	public int getEndPageS(int page);
	
	public int getLastPageS(HashMap<String, Object> params);
	
	public int getSkipS(int page);
	
	public TipBoard getBoardS(int boardname, int boardno);
	
	//첨부파일 갖다주는 기능 추가
	public File getAttachFileS(int boardname, int boardno);
	
	//코멘트기능
	public HashMap<String, Object> selectAllComments(int page);
	public int writeComments(int tipComments_groupno, String tipComments_content, String tipComments_userid);
	public int deleteTipComments(int tipComments_no,int tipComments_groupno);	
	public int modifyTipComments(int tipComments_no, String tipComments_content);
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int page);	
	
}

