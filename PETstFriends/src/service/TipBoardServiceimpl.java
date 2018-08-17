package service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ITipBoardDao;
import model.TipBoard;

@Service
public class TipBoardServiceimpl implements TipBoardService{

	@Autowired
	private ITipBoardDao tipDao;
	private static int StartPg;

	@Override
	public int writeTipBoardS(TipBoard dtBoard, MultipartFile TipBoard_contentPic) {
		// TODO Auto-generated method stub
		
//		String path = "C:/Users/seryu/Desktop/image/";
		String path = "C:/BitCamp/image/";
		
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
		System.out.println("여기옴2");
		return dtBoard.getTipBoard_boardno();
	}

}
