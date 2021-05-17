package com.arbor.home.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.CartVO;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SubOrderVO;

@Controller
public class OrderController {
	@Inject
	OrderServiceImp orderService;
	
	/* client */
	@RequestMapping("/order")
//	@RequestMapping(value="/order", method = RequestMethod.POST)
	public ModelAndView orderPage(@Nullable
	@RequestParam(value="optnameArr", required=true) String[] optInfoArr,
	@RequestParam(value="priceArr", required=true) String[] priceArr,
	@RequestParam(value="pnoStr", required=true) String pnoStr,
	@RequestParam(value="quantityArr", required=true) String[] quantityArr,
			MemberVO memberVo, OrderTblVO orderVo, HttpSession session
			) {
		
		System.out.println("옵션갯수->"+optInfoArr.length);
		// 여긴 출력값 이런식으로 확인해서 쓰면 된다는 예시를 남긴고얌 지워도 댐!!! 
		System.out.println("Arr몇개?"+priceArr.length);
		
		System.out.println("pnoStr->"+pnoStr);
		
		List<SubOrderVO> subOrderList = new ArrayList<SubOrderVO>();
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("logId");
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			orderVo.setUserid(userid);
			System.out.println("userid->"+userid + ", getUserid()->"+orderVo.getUserid());
			
			for(int i=0; i<priceArr.length; i++) {
				SubOrderVO subVo = new SubOrderVO();
				
				System.out.println(" optInfoArr->"+optInfoArr[i]);
				System.out.println(" priceArr->"+priceArr[i]);
				System.out.println(" quantityArr->"+quantityArr[i]);

				if(optInfoArr.length>0) {
					System.out.println("gma,,");
					subVo.setOptinfo(optInfoArr[i]);
				}
				System.out.println("!!!");
				
				subVo = orderService.getProductInfo(Integer.parseInt(pnoStr));
				subVo.setQuantity(Integer.parseInt(quantityArr[i]));
				subVo.setSubprice(Integer.parseInt(priceArr[i]));
				
				System.out.println("1."+subVo.getOptinfo());
				System.out.println("2."+subVo.getQuantity());
				System.out.println("3."+subVo.getSubprice());
				System.out.println("4."+subVo.getPname());
				System.out.println("5."+subVo.getImg1());
				System.out.println("6."+subVo.getPprice());
				System.out.println("7."+subVo.getSaleprice());
				System.out.println("8."+subVo.getDeliveryprice());
				
				System.out.println("subList->"+subOrderList);
				System.out.println("size()->"+subOrderList.size());
				
				subOrderList.add(subVo);
			}
			mav.addObject("subOrderList", subOrderList);
			
			mav.addObject("memberVo", orderService.getMemberInfo(userid));
			mav.addObject("pointVo", orderService.getUserPoint(userid));
			mav.addObject("couponList", orderService.getUserCoupon(userid));
			mav.addObject("cpnCount", orderService.getCouponCount(userid));			
			mav.setViewName("client/order/order");
		}
		return mav;
	}
	
	@RequestMapping(value="/orderOk", method=RequestMethod.POST)
	public ModelAndView orderOk(
			OrderTblVO orderVo, String applyNum, HttpSession session,
			@RequestParam(value="pno",required=true) int[] pnoArr,
			@RequestParam(value="pname",required=true) String[] pnameArr,
			@RequestParam(value="quantity",required=true) int[] quantityArr,
			@RequestParam(value="subprice",required=true) int[] subpriceArr
			) {
		String userid = (String)session.getAttribute("logId");
		orderVo.setUserid(userid);
				
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String today = sdf.format(now);
		String orderSeq = String.valueOf(orderService.getOrderSeq());
		int orderno = Integer.parseInt(today+orderSeq);
		orderVo.setOrderno(orderno); //당일날짜+시퀀스 형식으로 주문번호 생성 (ex.210511-03)
		
		if(orderService.orderComplete(orderVo)>0) {	//주문완료 db 생성
			for(int i=0; i<pnoArr.length; i++) {
				SubOrderVO subVo = new SubOrderVO();
				subVo.setOrderno(orderVo.getOrderno());
				subVo.setPno(pnoArr[i]);
				subVo.setPname(pnameArr[i]);
				subVo.setQuantity(quantityArr[i]);
				subVo.setSubprice(subpriceArr[i]);
				
				orderService.createSubOrderList(subVo);	//주문완료한 상품정보 db 생성
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pList", orderService.getSubOrderList(orderVo.getOrderno()));
		mav.addObject("orderVo", orderService.getOrderInfo(orderVo.getOrderno()));
		mav.addObject("applyNum", applyNum);
		mav.setViewName("client/order/orderOk");
		return mav;
	}
	
	@RequestMapping(value="/orderAppendCart", method = RequestMethod.POST)
	public ModelAndView orderAppendCartList(int pno, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)ses.getAttribute("logId");
		mav.addObject("list", orderService.cartAppendList(pno, userid));
		mav.setViewName("client/cart/test");
		return mav;
	}
	@RequestMapping(value="/orderAppendCartList", method = RequestMethod.POST)
	public ModelAndView orderAppendCart(@RequestParam(value="cartpno", required=true) String[] cartpno, HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		List<CartVO> list = new ArrayList<CartVO>();
		for(int i=0; i<cartpno.length; i++) {
			int cartno = Integer.parseInt(cartpno[i]);
			String userid = (String)ses.getAttribute("logId");
			CartVO vo = new CartVO();
			vo = orderService.cartAppendChckList(cartno, userid);
			list.add(vo);
		}
		mav.addObject("list", list);
		mav.setViewName("client/cart/test");
		return mav;
	}
	
	@RequestMapping("orderAllCartList")
	public ModelAndView orderAllCartList(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)ses.getAttribute("logId");
		if(userid.equals("") || userid == null) {
			mav.setViewName("admin/member/login");
		}else {
			mav.addObject("list",orderService.cartAllList(userid));
			mav.setViewName("client/cart/test");
		}
		return mav;
	}
	
	//////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////	
	
	/* admin */
	@RequestMapping("/orderAdmin")
	public ModelAndView orderManagement(
			@Nullable
			@RequestParam(value="orderno",required=false) int[] ordernoArr,
			OrderTblVO orderVo, HttpServletRequest req) {

		String pageNumStr = req.getParameter("pageNum");
		PageSearchVO pageVo = new PageSearchVO();
		if(pageNumStr!=null) {
			pageVo.setPageNum(Integer.parseInt(pageNumStr));
		}	
		
		pageVo.setTotalRecord(orderService.totalRecord(pageVo));
		
		System.out.println("pageNum->"+pageVo.getPageNum());
		System.out.println("startPageNum->"+pageVo.getStartPageNum());
		System.out.println("onePageNum->"+pageVo.getOnePageNum());
		
		
		//달력 선택하여 검색시, 날짜 유형 변경
		if(orderVo.getPeriod()!=null || orderVo.getOrderSearch_from()!=null || orderVo.getSearchWord()!=null) {
			String sf = orderVo.getOrderSearch_from();
			String st = orderVo.getOrderSearch_to();
			if((sf!=null || !sf.equals("")) && (st!=null || !st.equals(""))) {
				sf = sf.replace("-", "/");
				st = st.replace("-", "/");
				orderVo.setOrderSearch_from(sf);
				orderVo.setOrderSearch_to(st);
			}
		}
		//주문상태 변경
		if(orderVo.getStatus()!=null && ordernoArr!=null) {
			for(int i=0; i<ordernoArr.length; i++) {
			System.out.println("ordernoArr["+i+"]->"+ordernoArr[i]+" / "+orderVo.getStatus());
				
			orderService.updateOrderStatus(ordernoArr[i], orderVo.getStatus());
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", orderService.countOfOrderStatus(orderVo));
		mav.addObject("list", orderService.selectOrderList(orderVo));
		mav.addObject("pageVO", pageVo);
		System.out.println("orderList->"+orderService.selectOrderList(orderVo).size());
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

