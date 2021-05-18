package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.MemberDAOImp;
import com.arbor.home.vo.MemPagingCri;
import com.arbor.home.vo.MemberDormantVO;
import com.arbor.home.vo.MemberQuitVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.PageSearchVO;

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

	@Override
	public int insertByeMemberMulti(String userid, String reason) {
		
		return memberDAO.insertByeMemberMulti(userid, reason);
	}
	
	@Override
	public List<MemberVO> memSearchPaging(MemPagingCri cri) {
		
		return memberDAO.memSearchPaging(cri);
	}

	@Override
	public int memCount(MemPagingCri cri) {
		
		return memberDAO.memCount(cri);
	}

	@Override
	public int insertDormantMember(String userid, String reason) {
		return memberDAO.insertDormantMember(userid, reason);
	}

	@Override
	public List<MemberDormantVO> memDormantPaging(PageSearchVO vo) {
		return memberDAO.memDormantPaging(vo);
	}

	@Override
	public int memDormantCount() {
		return memberDAO.memDormantCount();
	}

	@Override
	public int dormantmailsend(String userid) {
		
		return memberDAO.dormantmailsend(userid);
	}

	@Override
	public int dormantMultiDel(String userid) {
		
		return memberDAO.dormantMultiDel(userid);
	}

	@Override
	public List<MemberQuitVO> memQuitPaging(MemPagingCri cri) {
		
		return memberDAO.memQuitPaging(cri);
	}

	@Override
	public int memQuitCount(MemPagingCri cri) {

		return memberDAO.memQuitCount(cri);
	}

	@Override
	public int permanantDel(String userid) {
		
		return memberDAO.permanantDel(userid);
	}

	@Override
	public int permanantDel2(String userid) {
		return memberDAO.permanantDel2(userid);
	}

	@Override
	public int permanantDel3(String userid) {
		return memberDAO.permanantDel3(userid);
	}

	@Override
	public List<MemberVO> memberExcelDownload(MemberVO vo) {
		
		return memberDAO.memberExcelDownload(vo);
	}
	
	@Override
	public List<MemberVO> dormantExcelDownload(MemberVO vo) {
		
		return memberDAO.dormantExcelDownload(vo);
	}

	@Override
	public MemberVO memberIdSearchOk(String username, String email) {
		
		return memberDAO.memberIdSearchOk(username, email);
	}
	
}
