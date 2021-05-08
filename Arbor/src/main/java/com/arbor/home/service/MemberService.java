package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.MemberDAOImp;
import com.arbor.home.vo.MemberVO;

@Service
public class MemberService implements MemberServiceImp {

	@Inject
	MemberDAOImp memberDAO;

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return memberDAO.loginCheck(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		return memberDAO.memberInsert(vo);
	}

	@Override
	public int idCheck(String userid) {
		return memberDAO.idCheck(userid);
	}

	@Override
	public List<MemberVO> memberAllselect(MemberVO vo) {
		
		return memberDAO.memberAllselect(vo);
	}

	@Override
	public int lastDateUpdate(String lastdate, String nowid) {
		return memberDAO.lastDateUpdate(lastdate, nowid);
	}

	@Override
	public int memDormant(String userid) {
		return memberDAO.memDormant(userid);
	}

	@Override
	public int memDel(String userid) {
		return memberDAO.memDel(userid);
	}

	@Override
	public int memMultiDel(String userid) {
		return memberDAO.memMultiDel(userid);
	}

	@Override
	public MemberVO pwdCheck(String userid) {
		
		return memberDAO.pwdCheck(userid);
	}

	@Override
	public int memberQuit(String userid) {
		
		return memberDAO.memberQuit(userid);
	}

	@Override
	public int insertByeMember(String userid, String reason) {
		return memberDAO.insertByeMember(userid, reason);
	}

	@Override
	public MemberVO memUpdateSelect(String vo) {
		
		return memberDAO.memUpdateSelect(vo);
	}

	@Override
	public int memberUpdateOk(MemberVO vo) {
		
		return memberDAO.memberUpdateOk(vo);
	}
	
	
	
}
