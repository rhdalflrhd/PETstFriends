package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MalDao;
import model.Mal;

@Service
public class MalServiceImpl implements MalService{

	@Autowired
	MalDao mDao;

	@Override
	public List<Mal> selectMalAll() {
		// TODO Auto-generated method stub
		return mDao.selectMalAll();
	}

	@Override
	public int addMal(Mal mal) {
		// TODO Auto-generated method stub
		return mDao.insertMal(mal);
	}

	@Override
	public int deleteMal(int mal_no) {
		// TODO Auto-generated method stub
		return mDao.deleteMal(mal_no);
	}
}