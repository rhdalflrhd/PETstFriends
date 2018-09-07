package dao;

import java.util.HashMap;
import java.util.List;

import model.MeetingBoardApply;

public interface ApplyDao {
	public boolean insertApply(MeetingBoardApply mApply);//모임 신청
	public boolean deleteApply(HashMap<String, Object> params);//모임신청 취소
	public List<MeetingBoardApply> selectOneApply(String meetingBoardApply_userId);//마이페이지 내가신청한 모임보기
	public List<MeetingBoardApply> selectAllApply(int meeting_boardno);//작성자 - 모임 신청자 목록보기
}
