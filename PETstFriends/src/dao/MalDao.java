package dao;

import java.util.List;

import model.Mal;

public interface MalDao {
	public List<Mal> selectMalAll();
	public int insertMal(Mal mal);
	public int deleteMal(int mal_no);
	
}