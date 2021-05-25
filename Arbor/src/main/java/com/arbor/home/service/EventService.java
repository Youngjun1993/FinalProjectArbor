package com.arbor.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.EventDAOImp;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.EventVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.PrevNextVO;

@Service
public class EventService implements EventServiceImp {
	
	@Inject
	EventDAOImp eventdao;

	@Override
	public List<EventVO> eventList(EventVO vo) {
		return eventdao.eventList(vo);
	}

	@Override
	public EventVO eventSelect(int eventNo) {
		return eventdao.eventSelect(eventNo);
	}

	@Override
	public List<EventVO> closeEvent(EventVO vo) {
		return eventdao.closeEvent(vo);
	}

	@Override
	public PrevNextVO lagLeadSelect(int eventNo) {
		return eventdao.lagLeadSelect(eventNo);
	}

	@Override
	public List<EventVO> eventListSelect(PageSearchVO pageVo) {
		return eventdao.eventListSelect(pageVo);
	}

	@Override
	public int eventInsert(EventVO vo) {
		return eventdao.eventInsert(vo);
	}

	@Override
	public EventVO getFilename(int eventNo) {
		return eventdao.getFilename(eventNo);
	}

	@Override
	public int eventUpdate(EventVO vo) {
		return eventdao.eventUpdate(vo);
	}

	@Override
	public int eventDelete(int eventNo) {
		return eventdao.eventDelete(eventNo);
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		return eventdao.totalRecord(vo);
	}
	
	@Override
	public List<CouponVO> checkUserCoupon(String userid, int cpnadno) {
		return eventdao.checkUserCoupon(userid, cpnadno);
	}

	@Override
	public CouponVO couponInfo(int cpnadno) {
		return eventdao.couponInfo(cpnadno);
	}

	@Override
	public int getCoupon(CouponVO cpnVo) {
		return eventdao.getCoupon(cpnVo);
	}

	@Override
	public int getCateInfo(int subno) {
		return eventdao.getCateInfo(subno);
	}

	
}
