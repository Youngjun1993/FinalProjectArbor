package com.arbor.home.dao;

import com.arbor.home.vo.MemberVO;

public interface MemberDAOImp {
	//로그인
	public MemberVO loginCheck(MemberVO vo);
	
	//회원가입
	public int memberInsert(MemberVO vo);
	
	//idCheck
	public int idCheck(String userid);
	
}