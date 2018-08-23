package service;
import model.TipBoard;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ITipBoardDao;
import dao.UserDao;
import model.User;

@Service
public class TipBoardServiceimpl implements TipBoardService{

	@Autowired
	private ITipBoardDao tipDao;
	private static int StartPg;

	private static UserDao uDao;
	
	@Override
	public int writeTipBoardS(TipBoard dtBoard, MultipartFile TipBoard_contentPic) {
		//여기서 해야하는 역할. 1. 게시글작성
		//					2. 사용자 score 10점 추가.
		

		//String Userid = (String)session.getAttribute("TipBoard_userId");
		//String Userid = dtBoard.getTipBoard_userId;                       둘 중 택 1
		
		//User tempUser = uDao.selectUserId(dtBoard.getTipBoard_userId)
		//tempUser.setScore(tempUser.getUser_score()+10);
		//UDao.updateUser(tempUser);
		
	//-----------------------------글작성시 사용자 score +10점 하는 기능 처리 끝-------------------------------------------	
		// TODO Auto-generated method stub
		System.out.println("writeTipBoard 서비스로 들어옴");
		String path = "C:/BitCamp/PetstFriends/";
		
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdirs();//저 경로에 폴더 없으면 폴더하나 만들어 make directory
		}
		String fileName = TipBoard_contentPic.getOriginalFilename();
		File attachFile = new File(path + fileName);
		
		try {		
			TipBoard_contentPic.transferTo(attachFile);
			dtBoard.setTipBoard_file(fileName);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("오류남1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오류남2");
		}
		
		System.out.println("여기옴1");	
		tipDao.insertBoard(dtBoard);
		//다오 호출
		System.out.println("여기옴2");
		return dtBoard.getTipBoard_boardno();
	}

	@Override
	public int ModifyTipBoardS(TipBoard dtBoard) {
		// TODO Auto-generated method stub
	
	HashMap<String, Object> params= new HashMap<String, Object>();
	params.put("tipBoard_boardname", dtBoard.getTipBoard_boardname());
	params.put("tipBoard_boardno", dtBoard.getTipBoard_boardno());	
	TipBoard originBoard = tipDao.selectOneBoard(params);
	if (originBoard.getTipBoard_userId().equals(dtBoard.getTipBoard_userId()))
		return tipDao.updateBoard(dtBoard);
	else
		return 0;
	}

	@Override
	public int DeleteTipBoardS(int boardname, int boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", boardname);
		params.put("tipBoard_boardno", boardno);
		return tipDao.deleteBoard(params);
	}

	@Override
	public TipBoard ReadTipBoardS(int boardname, int boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", boardname);
		params.put("tipBoard_boardno", boardno);	
		TipBoard temp = tipDao.selectOneBoard(params);
		temp.setTipBoard_readCount(temp.getTipBoard_readCount()+1);
		tipDao.updateBoard(temp);
		return temp;
	}

	@Override
	public HashMap<String, Object> SearchTipBoardS(HashMap<String, Object> params, int page) {
		// TODO Auto-generated method stub
		System.out.println("SearchTipBoardS 들어옴");
		System.out.println(params.get("tipBoard_title"));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int getEndPage = getEndPageS(page);
		int getLastPage = getLastPageS(params);

	
		if (getEndPage >= getLastPage)
			result.put("end", getLastPageS(params));
		else
			result.put("end", getEndPageS(page));

		result.put("current", page);
		result.put("start", getStartPageS(page));
		result.put("last", getLastPageS(params));
		
		params.put("skip", getSkipS(page));
		params.put("qty", 10);	
		System.out.println("SearchTipBoardS 최종 파람:" + params.toString());

//		System.out.println("겟카운트:" + tipDao.getCount(params));		
		int size = tipDao.getCount(params);				
		
		result.put("dogTipBoardList", tipDao.selectBoardPage(params));
		result.put("dogTipBoardCount", size);
		
		
//		result.put("current", page);
//		result.put("startPage", getStartPageS(page));
//		result.put("endPage", getEndPageS(page));
//		result.put("last", getLastPageS(params));	
//		params.put("skip", getSkipS(page));
//		params.put("qty", 10);		
//		result.put("dogTipBoardList", tipDao.selectBoardPage(params));	

		System.out.println(params.get("tipBoard_boardname"));
		return result;
	}

	@Override
	public int getStartPageS(int page) {
		// TODO Auto-generated method stub
		return (page- 1) / 10 * 10 + 1;
	}

	@Override
	public int getEndPageS(int page) {
		// TODO Auto-generated method stub
		return ((page-1) / 10 + 1) * 10;
	}

	@Override
	public int getLastPageS(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (tipDao.getCount(params) - 1 ) / 10 + 1;
	}

	@Override
	public int getSkipS(int page) {
		// TODO Auto-generated method stub
		return (page - 1) * 10;
	}

	@Override
	public TipBoard getBoardS(int boardname, int boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", boardname);
		params.put("tipBoard_boardno", boardno);
		return tipDao.selectOneBoard(params);
	}

	@Override
	public File getAttachFileS(int boardname, int boardno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", boardname);
		params.put("tipBoard_boardno", boardno);
		TipBoard temp = tipDao.selectOneBoard(params);
		String fileName = temp.getTipBoard_file();
		String path = "C:/BitCamp/PetstFriends/";
		return new File(path + fileName);
	}

	@Override
	public HashMap<String, Object> selectAllComments(int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int writeComments(int tipComments_groupno, String tipComments_content, String tipComments_userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTipComments(int tipComments_no, int tipComments_groupno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyTipComments(int tipComments_no, String tipComments_content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getLastBoardno(int boardname, String user_Id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("tipBoard_boardname", boardname);
		//지금은 보드네임만 넣지만 유저랑 합치면 유저 아이디도 넣어야함 ㅇㅇ
		return tipDao.getLastBoardno(param);
	}

}
