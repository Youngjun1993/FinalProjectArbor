package com.arbor.home.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.CouponVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SubOrderVO;

@Controller
public class OrderController {
	@Inject
	OrderServiceImp orderService;

	/* client */
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public ModelAndView orderPage(@Nullable @RequestParam(value = "optnameArr", required = true) String[] optInfoArr,
			@RequestParam(value = "priceArr", required = true) String[] priceArr,
			@RequestParam(value = "pnoStr", required = true) String pnoStr,
			@RequestParam(value = "quantityArr", required = true) String[] quantityArr, MemberVO memberVo,
			OrderTblVO orderVo, HttpSession session) {

		List<SubOrderVO> subOrderList = new ArrayList<SubOrderVO>();
		ModelAndView mav = new ModelAndView();

		String userid = (String)session.getAttribute("logId");
		orderVo.setUserid(userid);
		int cpnCount = 0;

		SubOrderVO subVo = new SubOrderVO();
		for(int i = 0; i < priceArr.length; i++) {
			subVo = orderService.getProductInfo(Integer.parseInt(pnoStr));
			
			if(optInfoArr.length == 0) {
				subVo.setOptinfo("");
			}else {
				subVo.setOptinfo(optInfoArr[i]);
			}
			subVo.setQuantity(Integer.parseInt(quantityArr[i]));
			subVo.setSubprice(Integer.parseInt(priceArr[i]));
			
			subOrderList.add(subVo);
			cpnCount += orderService.couponCount(userid, subVo.getSubno());
			
			System.out.println("subVo.getSubno()->"+subVo.getSubno());
			System.out.println("subVo.getPno()->"+subVo.getPno());
		}
		
		mav.addObject("pInfoList", subOrderList);
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pointVo", orderService.getUserPoint(userid));
		mav.addObject("couponList", orderService.getUserCoupon(userid));
		mav.addObject("cpnCount", cpnCount);
		mav.setViewName("client/order/order");
		return mav;
	}
	
	@RequestMapping("/cpnSelect")
	@ResponseBody
	public CouponVO cpnSelect(String cpnno) {
		return orderService.cpnSelect(Integer.parseInt(cpnno));
	}

	@RequestMapping(value = "/orderAppendCart", method = RequestMethod.POST) /* 장바구니 - 바로구매 */
	public ModelAndView orderAppendCartList(int pno, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String) ses.getAttribute("logId");
		List<SubOrderVO> list = orderService.cartAppendList(pno, userid);
		int cpnCount=0;
		for(int i=0; i<list.size(); i++) {
			SubOrderVO vo = list.get(i);
			cpnCount += orderService.couponCount(userid, vo.getSubno());
		}
		
		mav.addObject("pInfoList", list);
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pointVo", orderService.getUserPoint(userid));
		mav.addObject("couponList", orderService.getUserCoupon(userid));
		mav.addObject("cpnCount", cpnCount);
		mav.setViewName("client/order/order");
		return mav;
	}

	@RequestMapping(value = "/orderAppendCartList", method = RequestMethod.POST) /* 장바구니 - 선택구매 */
	public ModelAndView orderAppendCart(@RequestParam(value = "cartpno", required = true) String[] cartpno,
			HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		List<SubOrderVO> list = new ArrayList<SubOrderVO>();
		String userid = (String) ses.getAttribute("logId");
		int cpnCount = 0;
		for (int i = 0; i < cartpno.length; i++) {
			int cartno = Integer.parseInt(cartpno[i]);
			SubOrderVO vo = new SubOrderVO();
			vo = orderService.cartAppendChckList(cartno, userid);
			list.add(vo);
		}
		List<SubOrderVO> subnoList = orderService.getSubnoSelect(userid);
		for(int i=0; i<subnoList.size(); i++) {
			cpnCount += orderService.couponCount(userid, subnoList.get(i).getSubno());
		}
		mav.addObject("pInfoList", list);
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pointVo", orderService.getUserPoint(userid));
		mav.addObject("couponList", orderService.getUserCoupon(userid));
		mav.addObject("subnoList", subnoList);
		mav.addObject("cpnCount", cpnCount);
		mav.setViewName("client/order/order");
		return mav;
	}

	@RequestMapping("/orderAllCartList") /* 장바구니 - 전체구매 */
	public ModelAndView orderAllCartList(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String) ses.getAttribute("logId");
		int cpnCount=0;
		if (userid.equals("") || userid == null) {
			mav.setViewName("admin/member/login");
		} else {
			List<SubOrderVO> subnoList = orderService.getSubnoSelect(userid);
			for(int i=0; i<subnoList.size(); i++) {
				cpnCount += orderService.couponCount(userid, subnoList.get(i).getSubno());
			}
			
			mav.addObject("pInfoList", orderService.cartAllList(userid));
			mav.addObject("memberVo", orderService.getMemberInfo(userid));
			mav.addObject("pointVo", orderService.getUserPoint(userid));
			mav.addObject("couponList", orderService.getUserCoupon(userid));
			mav.addObject("subnoList", subnoList);
			mav.addObject("cpnCount", cpnCount);
			mav.setViewName("client/order/order");
		}
		return mav;
	}

	@RequestMapping(value = "/orderOk", method = RequestMethod.POST)
	public ModelAndView orderOk(OrderTblVO orderVo, HttpSession session,
			@RequestParam(value = "pno", required = true) int[] pnoArr,
			@RequestParam(value = "pname", required = true) String[] pnameArr,
			@RequestParam(value = "optinfo", required = true) String[] optinfoArr,
			@RequestParam(value = "quantity", required = true) int[] quantityArr,
			@RequestParam(value = "subprice", required = true) int[] subpriceArr,
			@RequestParam(value = "cartno", required = true) int[] cartnoArr) {
		
		System.out.println("cartnoArr->"+cartnoArr.length);
		
		String userid = (String) session.getAttribute("logId");
		orderVo.setUserid(userid);
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String today = sdf.format(now);
		String orderSeq = String.valueOf(orderService.getOrderSeq());
		int orderno = Integer.parseInt(today + orderSeq);
		orderVo.setOrderno(orderno); // 당일날짜+시퀀스 형식으로 주문번호 생성 (ex.21051103)
		
		//orderVo.setApplynum(applyNum);	//결제 승인번호
		System.out.println("승인번호->"+orderVo.getApplynum());
		System.out.println("아임포트 고유번호->"+orderVo.getImp_uid());
		System.out.println("거래 고유번호->"+orderVo.getMerchant_uid());

		if (orderService.orderComplete(orderVo) > 0) { // 주문완료 db 생성
			System.out.println("** 주문 DB 생성 완료");
			for (int i = 0; i < pnoArr.length; i++) {
				SubOrderVO subVo = new SubOrderVO();
				if(optinfoArr.length==0) {
					subVo.setOptinfo("");
				}else{
					subVo.setOptinfo(optinfoArr[i]);
				}
				subVo.setOrderno(orderVo.getOrderno());
				subVo.setPno(pnoArr[i]);
				subVo.setPname(pnameArr[i]);
				subVo.setQuantity(quantityArr[i]);
				subVo.setSubprice(subpriceArr[i]);

				orderService.createSubOrderList(subVo); // 주문완료한 상품정보 db 생성
				
				if(cartnoArr.length == 0) {
					break;
				}else {
					orderService.deleteCartList(cartnoArr[i], userid);
					System.out.println("cartnoArr["+i+"]->"+cartnoArr[i]+" 삭제 완료"); //장바구니 상품 주문시, 해당 상품 장바구니에서 삭제
				}
				orderService.updateProductStock(pnoArr[i]);	//주문상품 재고량 수정(-)
			}
		}
		System.out.println("사용적립금->"+orderVo.getUsepoint());
		if(orderVo.getUsepoint()>0) {
			orderService.setUsedPoint(orderVo);	//사용적립금 db 반영(-)
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pList", orderService.getSubOrderList(orderVo.getOrderno()));
		mav.addObject("orderVo", orderService.getOrderInfo(orderVo.getOrderno()));
		mav.setViewName("client/order/orderOk");
		return mav;
	}
	
	//////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////

	/* admin */
	@RequestMapping("/orderAdmin")
	public ModelAndView orderManagement(
			@Nullable @RequestParam(value = "orderno", required = false) int[] ordernoArr,
			PageSearchVO pageVo, OrderTblVO orderVo, HttpServletRequest req) {
		
		String pageNumStr = req.getParameter("pageNum");
		if (pageNumStr != null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		pageVo.setTotalRecord(orderService.totalRecord(pageVo));
				
		ModelAndView mav = new ModelAndView();
		// 달력 선택하여 검색시, 날짜 유형 변경
		if (pageVo.getOrderSearch_from()!=null || pageVo.getSearchWord()!=null) {
			String sf = pageVo.getOrderSearch_from();
			String st = pageVo.getOrderSearch_to();
			mav.addObject("orderSearch_from", sf);
			mav.addObject("orderSearch_to", st);
			System.out.println("검색 시작일:"+sf+" / 검색 종료일:"+st);
			if ((sf != null || !sf.equals("")) && (st != null || !st.equals(""))) {
				sf = sf.replace("-", "/");
				st = st.replace("-", "/");
				pageVo.setOrderSearch_from(sf);
				pageVo.setOrderSearch_to(st);
			}
		}
		if(orderVo.getSearchWord()!=null) {
			mav.addObject("searchKey", orderVo.getSearchKey());
			mav.addObject("searchWord", orderVo.getSearchWord());
		}
		// 주문상태 변경
		if (orderVo.getChangestatus()!=null && ordernoArr!=null) {
			for (int i = 0; i < ordernoArr.length; i++) {
				System.out.println("ordernoArr[" + i + "]->" + ordernoArr[i] + " / " + orderVo.getChangestatus());

				orderService.updateOrderStatus(ordernoArr[i], orderVo.getChangestatus());
			}
			if(orderVo.getChangestatus().equals("배송완료")) {
				orderService.setPlusPoint(orderVo);
				System.out.println("배송완료 OK -> 구매적립금 적립 완료");
			}
		}
		
		mav.addObject("cnt", orderService.countOfOrderStatus(orderVo));
		mav.addObject("list", orderService.selectOrderList(pageVo));
		System.out.println("주문리스트->" + orderService.selectOrderList(pageVo).size());
		mav.addObject("pageVO", pageVo);
		mav.setViewName("admin/order/orderAdmin");
		return mav;
	}

	@RequestMapping("/orderDetail")
	public ModelAndView orderDetail(int orderno) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pList", orderService.getSubOrderList(orderno));
		mav.addObject("memberVo", orderService.getUserInfo(orderno));
		mav.addObject("orderVo", orderService.getOrderInfo(orderno));
		mav.setViewName("admin/order/orderDetail");
		return mav;
	}

}
