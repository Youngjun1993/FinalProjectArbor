package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.MemPagingCri;
import com.arbor.home.vo.MemberDormantVO;
import com.arbor.home.vo.MemberVO;

public interface MemberServiceImp {
	//로그인
	public MemberVO loginCheck(MemberVO vo);
	
	//회원가입
	public int memberInsert(MemberVO vo);
	
	//idCheck
	public int idCheck(String userid);
	
	//로그아웃 타임 업데이트
	public int lastDateUpdate(String lastdate, String nowid);
	
	//휴면계정 전환 업데이트
	public int memDormant(String userid);
	
	//회원탈퇴 테이블 이동
	public int insertDormantMember(String userid, String reason);
	
	//휴면테이블 //휴면회원 검색 전체선택 +  페이징
	public List<MemberDormantVO> memDormantPaging(MemPagingCri cri);
	
	//휴면테이블 //총회원수 카운트(활성, 휴면 만)
	public int memDormantCount(MemPagingCri cri);
	
	//휴면메일 발송 업데이트
	public int dormantmailsend(String userid);
	
	//삭제이벤트
	public int memDel(String userid);
	
	//다중삭제
	public int memMultiDel(String userid);
	
	//비밀번호 체크
	public MemberVO pwdCheck(String userid);//userid 세션에서 구할 userid
	
	//회원탈퇴 확인
	public int memberQuit(String userid);
	
	//회원탈퇴 테이블 이동
	public int insertByeMember(String userid, String reason);
	
	//회원탈퇴 테이블 이동
	public int insertByeMemberMulti(String userid, String reason);
	
	//수정폼 이동시 회원정보 선택
	public MemberVO memUpdateSelect(String vo);
	
	//수정반영
	public int memberUpdateOk(MemberVO vo);
	
	//회원검색 전체선택 +  페이징
	public List<MemberVO> memSearchPaging(MemPagingCri cri);
	
	//총회원수 카운트(활성, 휴면 만)
	public int memCount(MemPagingCri cri);
	
}
