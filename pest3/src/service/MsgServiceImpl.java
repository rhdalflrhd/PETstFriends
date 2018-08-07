package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MsgAdminDao;
import dao.MsgDao;

@Service
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private MsgDao msg;
	@Autowired
	private MsgAdminDao msgAdmin;
}
