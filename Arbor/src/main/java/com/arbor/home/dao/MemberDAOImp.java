package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.MemPagingCri;
import com.arbor.home.vo.MemberDormantVO;
import com.arbor.home.vo.MemberQuitVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.PageSearchVO;

public interface MemberDAOImp {
	//로그인
	public MemberVO loginCheck(MemberVO vo);
	
	//회원가입
	public int memberInsert(MemberVO vo);
	
	//idCheck
	public int idCheck(String userid);
	
	// 로그인시 휴면회원여부 확인하기
	public int loginDorCheck(String userid);
	
	// 휴면회원 테이블에서 데이터 삭제
	public int loginDorDelete(String userid);
	
	// memstat 다시 0으로 돌리기
	public int loginDorUpdate(String userid);

	//로그아웃 타임 업데이트
	public int lastDateUpdate(String userid);
	
	//휴면계정 전환 업데이트
	public int memDormant(String userid);
	
	//회원탈퇴 테이블 이동
	public int insertDormantMember(String userid);
	
	//휴면회원 // 검색 전체선택 +  페이징
	public List<MemberDormantVO> memDormantPaging(PageSearchVO vo);
	
	// 휴면회원 전체 목록
	public List<MemberVO> dormantList();
	
	//휴면테이블 //총회원수 카운트(활성, 휴면 만)
	public int memDormantCount();
	
	//휴면메일 발송 업데이트
	public int dormantmailsend(String userid);
	
	//회원삭제
	public int memDel(String userid);
	
	//다중삭제
	public int memMultiDel(String userid);
	
	//비밀번호 체크
	public MemberVO pwdCheck(String userid);
	
	//회원탈퇴 확인
	public int memberQuit(String userid);
	
	//회원탈퇴 테이블 이동
	public int insertByeMember(String userid, String reason);
	
	//회원탈퇴 테이블 이동
	public int insertByeMemberMulti(String userid, String reason);
	
	//수정폼 이동시 회원정보 선택
	public MemberVO memUpdateSelect(String vo);
	
	//회워정보수정반영
	public int memberUpdateOk(MemberVO vo);
	
	//회원검색 페이징
	public List<MemberVO> memSearchPaging(MemPagingCri cri);
	
	//총회원수 카운트(활성, 휴면 만)
	public int memCount(MemPagingCri cri);
	
	//휴면회원 다중삭제
	public int dormantMultiDel(String userid);
	
	//탈퇴회워 리스트 + 페이징
	public List<MemberQuitVO> memQuitPaging(MemPagingCri cri);
	
	//탈퇴회원수 카운트
	public int memQuitCount(MemPagingCri cri);
	
	//탈퇴회원 영구삭제
	public int permanantDel(String userid);
	//탈퇴회원 영구삭제(휴면)
	public int permanantDel2(String userid);
	//탈퇴회원 영구삭제(member테이블)
	public int permanantDel3(String userid);
	
	//전체 회원 엑셀 다운로드
	public List<MemberVO> memberExcelDownload(MemberVO vo);
	
	//휴면 회원 엑셀 다운로드
	public List<MemberVO> dormantExcelDownload(MemberVO vo);
	
	//아이디 찾기
	public MemberVO memberIdSearchOk(String username, String email);
	
	//비밀번호 찾기 +  변경
	public int memberPwdSearchOk(String changepwd, String username, String email);
}