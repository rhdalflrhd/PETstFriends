package service;
import model.TipBoard;
import model.TipComments;
import model.TipLikes;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public int writeTipBoardS(TipBoard dtBoard,MultipartFile TipBoard_contentPic) {
		System.out.println("writeTipBoard 서비스로 들어옴");
		//여기서 해야하는 역할. 1. 게시글작성
		//					2. 사용자 score 10점 추가.
		

		//String Userid = (String)session.getAttribute("TipBoard_userId");
		//String Userid = dtBoard.getTipBoard_userId;                       둘 중 택 1
		
		//User tempUser = uDao.selectUserId(dtBoard.getTipBoard_userId)
		//tempUser.setScore(tempUser.getUser_score()+10);
		//UDao.updateUser(tempUser);
		
	//-----------------------------글작성시 사용자 score +10점 하는 기능 처리 끝-------------------------------------------	
		// TODO Auto-generated method stub

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
		
		System.out.println("tipDao.insertBoard 하기전 .여기옴1");	
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
	public int getLastBoardno(int boardname, String user_Id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("tipBoard_boardname", boardname);
		//지금은 보드네임만 넣지만 유저랑 합치면 유저 아이디도 넣어야함 ㅇㅇ
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

	
	//==============================팁보드 코멘트 서비스============================================	
	
	
	@Override
	public int writeTipComments(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
	     return tipDao.insertTipComments(param);
	}

	@Override
	public List<TipComments> getTipCommentsList(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		 
        List<TipComments> TipCommentsList = tipDao.selectAllTipcomments(param);
 
       
        //msyql 에서 계층적 쿼리가 어려우니 여기서 그냥 해결하자
 
        //부모
        List<TipComments> TipCommentsListParent = new ArrayList<TipComments>();
        //자식
        List<TipComments> TipCommentsListChild = new ArrayList<TipComments>();
        //통합
        List<TipComments> newTipCommentsList = new ArrayList<TipComments>();
 
        //1.부모와 자식 분리
        for(TipComments tComment: TipCommentsList){
            if(tComment.getTipComments_depth().equals("0")){
            	TipCommentsListParent.add(tComment);
            }else{
            	TipCommentsListChild.add(tComment);
            }
        }
 
        //2.부모를 돌린다.
        for(TipComments tipCommentsParent: TipCommentsListParent){
            //2-1. 부모는 무조건 넣는다.
        	newTipCommentsList.add(tipCommentsParent);
            //3.자식을 돌린다.
            for(TipComments tipCommentsChild: TipCommentsListChild){
                //3-1. 부모의 자식인 것들만 넣는다.
                if(tipCommentsParent.getTipComments_commentno().equals(tipCommentsChild.getTipComments_groupno())){
                	newTipCommentsList.add(tipCommentsChild);
                }
 
            }
 
        }
 
        //정리한 list return
        return newTipCommentsList;
	}

	@Override
	public int deleteTipComments(HashMap<String, Object> param) {
		// TODO Auto-generated method stub		
        
		if(param.get("r_type").equals("main")) {
            //부모부터 하위 다 지움
            return tipDao.deleteTipCommentsAll(param);
        }else {
            //자기 자신만 지움
            return tipDao.deleteTipComments(param);
        }
	}

	@Override
	public boolean updateTipComments(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		 return tipDao.updateTipComments(param);
	}
	
	@Override
	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int page) {
		// TODO Auto-generated method stub
		return null;
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

	//=========================================================================	
}
