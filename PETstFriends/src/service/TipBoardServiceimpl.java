package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ITipBoardDao;
import model.TipBoard;

@Service
public class TipBoardServiceimpl implements TipBoardService{

	@Autowired
	private ITipBoardDao tipDao;
	
	@Override
	public int writeTipBoardS(TipBoard dtBoard, MultipartFile file) {
		// TODO Auto-generated method stub
		return 0;
	}

}
