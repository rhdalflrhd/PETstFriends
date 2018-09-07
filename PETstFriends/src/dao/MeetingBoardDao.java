package dao;

import java.util.HashMap;
import java.util.List;

import model.MeetingBoard;

public interface MeetingBoardDao {

	public boolean insertBoard(MeetingBoard mBoard);//모임게시판 글작성
	public boolean updateBoard(MeetingBoard mBoard);//모임게시판 글수정
	public boolean deleteBoard(int meeting_boardno);//모임게시판 글삭제
	public MeetingBoard selectOneBoard(int meeting_boardno);//모임게시판 글 보기
	public List<HashMap<String, Object>> selectBoardAll(HashMap<String, Object> param);//모임게시판 글 목록 보기/검색
	public List<MeetingBoard> selectBoardAllbyID(String meetingBoard_userId);//마이페이지 내가 쓴 모임글 보기
	public MeetingBoard getCount();//모임게시판 게시글  총 갯수

}
