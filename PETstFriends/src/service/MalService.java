package service;

import java.util.List;

import model.Mal;

public interface MalService {
	public List<Mal> selectMalAll();
	public int addMal(Mal mal);
	public int deleteMal(int mal_no);
}
