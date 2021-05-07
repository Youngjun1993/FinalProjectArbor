package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.MemberVO;

public interface MemberServiceImp {
	//로그인
	public MemberVO loginCheck(MemberVO vo);
	
	//회원가입
	public int memberInsert(MemberVO vo);
	
	//idCheck
	public int idCheck(String userid);
	
	//회원검색 전체선택
	public List<MemberVO> memberAllselect(MemberVO vo);
	
	//로그아웃 타임 업데이트
	public int lastDateUpdate(String lastdate, String nowid);
	
	//휴면계정 전환 업데이트
	public int memDormant(String userid);
	
	//삭제이벤트
	public int memDel(String userid);
	
	//다중삭제
	public int memMultiDel(String userid);
	
	//비밀번호 체크
	public MemberVO pwdCheck(String userid);//userid 세션에서 구할 userid
}
