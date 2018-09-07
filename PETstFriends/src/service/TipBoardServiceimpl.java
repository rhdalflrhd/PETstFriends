package service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ITipBoardDao;
import dao.UserDao;
import model.TipBoard;
import model.TipComments;
import model.TipLikes;
import model.User;

@Service
public class TipBoardServiceimpl implements TipBoardService{

	@Autowired
	private ITipBoardDao tipDao;
	private static int StartPg;

	@Autowired
	private UserDao uDao;
	

	//해당팁보드게시판에 전체 글 갯수가 0이면, 더미용가짜글을 만들기위한 함수.
	@Override
	public int TipboardNullcheck(int boardname) {
		// TODO Auto-generated method stub
	    int TipboardNullcheckcount = tipDao.TipboardNullcheck(boardname);
	    return TipboardNullcheckcount;
	}
	/* 게시판의 좋아요 번호가 있는지 카운트 */

	
	@Override
	public int writeTipBoardS(TipBoard dtBoard,MultipartFile contentPic) {
		System.out.println("writeTipBoard 서비스로 들어옴");
		//여기서 해야하는 역할. 1. 게시글작성
		//					2. 사용자 score 10점 추가.
				
		User tempUser = uDao.selectUserbyId(dtBoard.getTipBoard_userId());
		System.out.println("맵퍼작동하나 확인해보자:  " +tempUser);
		tempUser.setUser_score(tempUser.getUser_score()+10);	
		uDao.updateScore(tempUser);
		
	//-----------------------------글작성시 사용자 score +10점 하는 기능 처리 끝-------------------------------------------	
		// TODO Auto-generated method stub

		if(contentPic !=null) {
		
		
		String path = "C:/BitCamp/PetstFriends/";
		
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdirs();//저  경로에 폴더 없으면 폴더하나 만들어 make directory
		}
		String fileName = contentPic.getOriginalFilename();
		File attachFile = new File(path + fileName);
		
		try {		
			contentPic.transferTo(attachFile);
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
		System.out.println(dtBoard.getTipBoard_file());	
		System.out.println("tipDao.insertBoard 하기전 .여기옴1");
		
		}//MultipartFile contentPic이 null 값이 아닐때만 위의 문장들이 실행됨
		
		tipDao.insertBoard(dtBoard);
		//다오 호출
		System.out.println("tipDao.insertBoard 한 후 .여기옴2");
		return dtBoard.getTipBoard_boardno();
	}

	@Override
	public int ModifyTipBoardS(TipBoard dtBoard,MultipartFile TipBoard_contentPic) {
		// TODO Auto-generated method stub
		System.out.println("ModifyTipBoardS 서비스로 들어옴");
		
	
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
			e.printStackTrace();
			System.out.println("오류남1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오류남2");
		}
					
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
		System.out.println("게시판은"+params.get("tipBoard_boardname"));

		
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
		int size = tipDao.getCount(params);
		System.out.println("size is :"+size);
		System.out.println("다오넣기전 확인용1 "+params.get("tipBoard_boardname"));
		int tName = (Integer)params.get("tipBoard_boardname");
		System.out.println("tName은"+tName);
			 
		System.out.println("다오넣기전 확인용2  "+params.get("tipBoard_boardname"));
		
		result.put("TipBoardList", tipDao.selectBoardPage(params));
		result.put("TipBoardCount", size);
	
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
		return (tipDao.getCount(params) - 2 ) / 10 + 1;
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
	public int getLastBoardno(int boardname, String user_Id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("tipBoard_boardname", boardname);
		param.put("tipBoard_userId", user_Id);
		return tipDao.getLastBoardno(param);
	}
	
	//해당 게시글의 라이크 카운트 업
	@Override 
	public int TipBoard_likeCnt_up(int boardname, int boardno) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", boardname);
		params.put("tipBoard_boardno", boardno);
		return tipDao.TipBoard_likeCnt_up(params);
	}

	//해당 게시글의 라이크 카운트 다운
	@Override
	public int TipBoard_likeCnt_down(int boardname, int boardno) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		params.put("tipBoard_boardname", boardname);
		params.put("tipBoard_boardno", boardno);
		return tipDao.TipBoard_likeCnt_down(params);
	}

	//==============================팁보드 좋아요 서비스===========================================	
	 
	
	/* 조회 */
	@Override
	public TipLikes readTipLikes(HashMap<String, Object> params) {
		TipLikes TL = tipDao.readTipLikes(params);
	    return TL;
	}
	
	
	/* 게시판의 좋아요 번호가 있는지 카운트 */
	@Override
	public int countbyLike(HashMap<String, Object> params) {
	    int count = tipDao.countbyLike(params);
	    return count;
	}
	
	/* 좋아요 번호 등록 */
	@Override
	public int createTipLikes(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
	    int count = tipDao.createTipLikes(params);
	    return count;
	}
	
	  /**
	   * 좋아요 체크 여부 (0 -> 1)
	   * @param hashMap
	   * @return
	   */
	@Override
	public int like_check(HashMap<String, Object> params) {
	    int count = tipDao.like_check(params);
	    return count;
	}

	 /**
	   * 좋아요 체크 여부 (1 -> 0)
	   * @param hashMap
	   * @return
	   */
	@Override
	public int like_check_cancel(HashMap<String, Object> params) {
	    int count = tipDao.like_check_cancel(params);
	    return count;
	}

	/* 게시판의 좋아요 삭제 */
	@Override
	public int deletebyBoardNameBoardno(int boardname, int boardno) {
		HashMap<String, Object> params= new HashMap<String, Object>();
		
		
	    int count = tipDao.deletebyBoardNameBoardno(params);
	    return count;
	}
	  
	/* 회원의 좋아요 삭제 */
	@Override
	public int deletebyUserId(String userid) {
	    int count = tipDao.deletebyUserId(userid);
	    return count;
	}

	
	//==============================팁보드 코멘트 서비스============================================

	@Override
	public int writeCommentTipBoard(TipComments tipComments) {
		// TODO Auto-generated method stub
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		tipComments.setTipComments_writeDate(simple.format(new Date()));
		String user_id = tipComments.getTipComments_userId();
		User user = uDao.selectUserbyId(user_id);
		user.setUser_score(user.getUser_score()+3);
		uDao.updateScore(user);
		int result = tipDao.insertComment(tipComments);
		if(tipComments.getTipComments_parent()==0) {
			tipComments.setTipComments_parent(tipComments.getTipComments_boardno());
			tipComments.setTipComments_commentno(tipComments.getTipComments_boardno());
			result = tipDao.updateCommentParent(tipComments);
		}
		return result;
	}
	
	@Override
	public HashMap<String, Object> ShowCommentTipBoard(int tipComments_boardname, int tipComments_boardno, int comment_page) {
		// TODO Auto-generated method stub
		int comment_numb = 3;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("tipComments_boardname", tipComments_boardname);
		params.put("tipComments_boardno", tipComments_boardno);
		params.put("comment_page", comment_page);
		params.put("comment_numb", comment_numb);
		 params.put("comment_current",comment_page);
		 params.put("comment_start", getStartCommentPage(comment_page, comment_numb));
		 if(getEndCommentPage(comment_page) > getLastCommentPage(params))
		 params.put("comment_end", getLastCommentPage(params));
		 else
		 params.put("comment_end", getEndCommentPage(comment_page));
		 params.put("comment_last", getLastCommentPage(params));
		int comment_skip = getCommentSkip(comment_page, comment_numb);
		params.put("comment_skip", comment_skip);
		List<TipComments> commentList = tipDao.selectCommentAll(params);
		params.put("commentList", commentList);
		return params;

	}	
	
	public int deleteComments(int tipComments_commentno, int tipComments_parent) {
		if(tipComments_commentno == tipComments_parent) { //가장 상위 댓글
			if(tipDao.groupCount(tipComments_commentno) == 1)//대댓 없는 경우(나만 패런트넘=코멘트넘이 자신 하나만 있는 경우) 
				tipDao.deleteComments(tipComments_commentno);//지우기
			else {
			  HashMap<String, Object> params = new HashMap<String, Object>();
			  params.put("tipComments_commentno", tipComments_commentno);
			  params.put("tipBoard_content", "");
			  tipDao.updateComments(params);//대댓있는경우 빈칸  
		  }
			
		}else { //대댓
		 if(tipDao.selectOneComments(tipComments_parent).getTipComments_content() ==""
				 && tipDao.groupCount(tipComments_commentno) == 2) {//패런트가코멘트넘인 원댓 지워지고 대댓 하나뿐인 경우
			 tipDao.deleteComments(tipComments_commentno);//해당댓
			 tipDao.deleteComments(tipComments_parent);//해당 원댓
		}
		 else //원댓 안지워지거나 대댓이 여러개인경우
			 tipDao.deleteComments(tipComments_commentno);
		}
		return tipComments_parent;
	}
	
	public int updateTipComment(int tipComments_commentno, String tipComments_content) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		  params.put("tipComments_commentno", tipComments_commentno);
		  params.put("tipComments_contentt", tipComments_content);
		return tipDao.updateComments(params);
	}
	
	public int getStartCommentPage(int comment_page, int numb) { // 시작페이지
		return (comment_page - 1) / 10 * 10 + 1;
	}

	public int getEndCommentPage(int comment_page) { // 마지막 페이지
		return ((comment_page - 1) / 10 + 1) * 10;
	}

	public int getLastCommentPage(HashMap<String, Object> params) {// 목록의 끝 번호
		int comment_numb = Integer.parseInt(String.valueOf(params.get("comment_numb")));
		return (tipDao.getCommentCount(params) - 1) / comment_numb + 1;
	}

	public int getCommentSkip(int comment_page, int comment_numb) {// 앞에 지나간 갯수
		return (comment_page - 1) * comment_numb;
	}

	public HashMap<String, Object> readCommentBoard(int tipComments_boardname, int tipComments_boardno){
		HashMap<String, Object> params = new HashMap<String, Object>();

		int comment_numb = 3;
		params.put("tipComments_boardname", tipComments_boardname);
		params.put("tipComments_boardno", tipComments_boardno);
		params.put("comment_numb", comment_numb);
		int comment_page = getLastCommentPage(params);// 댓글마지막 페이지 
		params.put("comment_page", comment_page);
		params.put("comment_current", comment_page);
		params.put("comment_start", getStartCommentPage(comment_page, comment_numb));
		params.put("comment_last",getLastCommentPage(params));
		if (getEndCommentPage(comment_page) > getLastCommentPage(params))
			params.put("comment_end", getLastCommentPage(params));
		else
			params.put("comment_end", getEndCommentPage(comment_page));
		int comment_skip = getCommentSkip(comment_page, comment_numb);
		params.put("comment_skip", comment_skip);
		List<TipComments> TipCommentList = tipDao.selectCommentAll(params);
		System.out.println("첫 댓글 출력 시작:"+TipCommentList);
		params.put("commentList", TipCommentList);
		params.put("listsize", TipCommentList.size());
		params.put("seryun", "세륜");
		return params;
	}
}
