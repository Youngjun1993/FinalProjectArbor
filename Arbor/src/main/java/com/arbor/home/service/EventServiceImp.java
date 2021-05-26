package com.arbor.home.service;

import java.util.List;

import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.EventVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PrevNextVO;

public interface EventServiceImp {
	/* client */
	public List<EventVO> eventList(EventVO vo);		//진행중인 이벤트 목록
	public EventVO eventSelect(int eventNo);		//이벤트 뷰
	public List<EventVO> closeEvent(EventVO vo);	//지난 이벤트 목록
	public PrevNextVO lagLeadSelect(int eventNo);	//이전글, 다음글 선택
	/* 쿠폰다운로드 이벤트 */
	public List<CouponVO> checkUserCoupon(String userid, int cpnadno);	//사용자 쿠폰 보유여부 확인
	public CouponVO couponInfo(int cpnadno);		//쿠폰 정보 얻어오기
	public int getCoupon(CouponVO cpnVo);			//사용자 db에 쿠폰 등록(이벤트 쿠폰 다운로드)
	/* 이벤트 상품 페이지 이동 */
	public int getCateInfo(int subno);			//상품 대분류번호 얻어오기
	
	
	/* admin */
	public List<EventVO> eventListSelect(PageSearchVO pageVo);	//이벤트 목록
	public int eventInsert(EventVO vo);					//이벤트 등록
	public EventVO getFilename(int eventNo);			//이벤트 수정시 이미지 파일명 얻어오기
	public int eventUpdate(EventVO vo);					//이벤트 수정
	public int eventDelete(int eventNo);				//이벤트 삭제
	public int totalRecord(PageSearchVO vo);			//총 레코드 수
}
