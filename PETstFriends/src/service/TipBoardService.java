package service;

import org.springframework.web.multipart.MultipartFile;

import model.TipBoard;

public interface TipBoardService {
	
	public int writeTipBoardS(TipBoard dtBoard, MultipartFile file);
}
