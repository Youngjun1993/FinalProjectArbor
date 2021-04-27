package com.arbor.home.service;

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

}
