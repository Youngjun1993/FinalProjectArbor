# 비트캠프 최종 프로젝트
### Arbor(라틴어 : 나무)라는 가구 쇼핑몰 구축하였습니다.

## 구현 및 기능

* ### Client
<table>
  <tr>
    <th width="120">분류</th>
    <th width="190">기능</th>
    <th width="700">설명</th>
  </tr>
  <tr>
    <td rowspan="4">회원가입</td>
    <td>회원가입</td>
    <td>- 회원정보 입력 및 유효성 검사 후 DB저장</td>
  </tr>
  <tr>
    <td>이메일 인증</td>
    <td>- 회원가입시 입력된 이메일로 인증번호 전송</td>
  </tr>
  <tr>
    <td>로그인/로그아웃</td>
    <td>- 가입된 아이디와 비밀번호를 DB에서 조회 후 로그인 구현</td>
  </tr>
  <tr>
    <td>아이디/비밀번호 찾기</td>
    <td>- 이름, 연락처, 이메일을 이용해 DB에서 아이디/비밀번호 찾기 구현</td>
  </tr>
  <tr>
    <td rowspan="9">마이페이지</td>
    <td>회원정보수정</td>
    <td>- 가입시 입력한 회원정보 수정</td>
  </tr>
  <tr>
    <td>회원탈퇴</td>
    <td>- 회원탈퇴 구현</td>
  </tr>
  <tr>
    <td>주문내역</td>
    <td>
      - 로그인 회원의 주문내역 게시판 구현<br/>
      - 배송상태별 버튼 구현(배송중, 배송완료, 교환/환불, 리뷰작성)
    </td>
  </tr>
  <tr>
    <td>장바구니</td>
    <td>
      - 로그인 회원의 장바구니 목록 출력<br/>
      - 옵션별 수량변경에 따른 최종금액, 적립금, 배송비, 수량 변경 구현<br/>
      - 옵션별 삭제 / 상품 선택삭제 구현<br/>
      - 각 상품 개별구매, 선택구매, 전체구매 구현
    </td>
  </tr>
  <tr>
    <td>찜목록</td>
    <td>
      - 로그인 회원의 찜목록 출력<br/>
      - 장바구니에 추가 / 찜목록에서 삭제 구현
    </td>
  </tr>
  <tr>
    <td>리뷰내역</td>
    <td>
      - 최신순, 평점순 정렬 구현<br/>
      - 등록한 리뷰 수정 및 삭제 구현
    </td>
  </tr>
  <tr>
    <td>적립금 내역</td>
    <td>- 상품 구매, 이벤트 등에 따른 적립이나 사용된 적립금 내역 게시판 구현</td>
  </tr>
  <tr>
    <td>쿠폰 내역</td>
    <td>
      - 지급된 쿠폰 목록 구현<br/>
      - 쿠폰사용 버튼 클릭시 사용가능한 상품페이지로 이동
    </td>
  </tr>
  <tr>
    <td>1:1 문의</td>
    <td>- 배송, 결제관련 등 작성한 문의내역 게시판 구현</td>
  </tr>
  <tr>
    <td rowspan="2">메인페이지</td>
    <td>상품 노출</td>
    <td>- 판매순(인기순), 등록순(신상품순)에 해당하는 상품 DB조회 후 노출</td>
  </tr>
  <tr>
    <td>이벤트 노출</td>
    <td>- LOOKBOOK 버튼 클릭시 진행중인 이벤트 노출</td>
  </tr>
  <tr>
    <td rowspan="3">가구</td>
    <td>상품</td>
    <td>- 판매상품 목록 나열(대분류:공간, 소분류:가구종류)</td>
  </tr>
  <tr>
    <td>상품 상세페이지</td>
    <td>
      - 옵션 선택, 찜하기, 장바구니 추가, 바로구매 버튼 구현<br/>
      - 상품별 리뷰, 문의 구현
    </td>
  </tr>
  <tr>
    <td>주문/결제</td>
    <td>
      - 주문자와 배송지 정보 입력 <br/> 
      - 적립금 및 쿠폰 사용여부 체크, 카드 결제(INIAPI) 사용
    </td>
  </tr>
  <tr>
    <td rowspan="2">커뮤니티</td>
    <td>공지사항</td>
    <td>- 공지사항 게시판 구현</td>
  </tr>
  <tr>
    <td>FAQ</td>
    <td>- FAQ 게시판 구현</td>
  </tr>
  <tr>
    <td rowspan="3">이벤트</td>
    <td>TIME SALE</td>
    <td>- 정해진 시간내에만 구매 가능한 타임세일 이벤트 구현</td>
  </tr>
  <tr>
    <td>진행중인 이벤트</td>
    <td>- 진행중인 이벤트 게시판 형태로 구현</td>
  </tr>
  <tr>
    <td>지난 이벤트</td>
    <td>- 지난 이벤트 게시판 형태로 구현</td>
  </tr>
  <tr>
    <td>ABOUT US</td>
    <td>회사소개</td>
    <td>- 회사소개 및 오프라인 매장 위치 구현(구글맵 API)</td>
  </tr>
</table>

* ### MANAGER
<table>
  <tr>
    <th width="120">분류</th>
    <th width="190">기능</th>
    <th width="700">설명</th>
  </tr>
  <tr>
    <td rowspan="3">회원관리</td>
    <td>회원검색</td>
    <td>
      - 접속시 전체 회원목록 출력<br/>
      - 검색어/이메일 및 문자 수신여부 기준에 따른 목록 출력<br/>
      - 문자 발송 및 회원목록 데이터 엑셀 다운로드 구현
    </td>
  </tr>
  <tr>
    <td>휴면회원</td>
    <td>
      - 한달 이상 미접속 회원 휴면회원으로 자동 전환<br/>
      - 휴면회원 목록 출력<br/>
      - 휴면메일 발송 및 데이터 엑셀 다운로드 구현<br/>
      - 휴면상태 해제 기능 구현
    </td>
  </tr>
  <tr>
    <td>탈퇴회원</td>
    <td>
      - 탈퇴한 회원 일정기간 정보 보관<br/>
      - 탈퇴회원 목록 출력 및 회원 완전삭제 구현
    </td>
  </tr>
  <tr>
    <td rowspan="4">상품관리</td>
    <td>상품목록 출력</td>
    <td>
      - 전체 카테고리 상품 출력<br/>
      - 상품 카테고리별 검색(상품명, 코드, 재고량, 등록일자) 구현
    </td>
  </tr>
  <tr>
    <td>상품등록</td>
    <td>
      - 상품 등록(상품정보 및 상세페이지에 들어갈 이미지, 옵션, 배송비 입력)<br/>
      - 상품 수정, 삭제 
    </td>
  </tr>
  <tr>
    <td>카테고리 관리</td>
    <td>
      - 상품 카테고리 추가등록 및 카테고리명 수정, 카테고리 삭제 구현
    </td>
  </tr>
  <tr>
    <td>상품문의 관리</td>
    <td>
      - 카테고리 상품별 검색 및 문의답변 구현
    </td>
  </tr>
  <tr>
    <td rowspan="2">주문관리</td>
    <td>주문</td>
    <td>
      - 신규주문, 배송준비, 배송중, 배송완료 별 건수 출력<br />
      - 주문일자, 주문번호, 주문상태, 주문자명 별 검색 구현<br />
      - 주문내역에서 주문상태(배송중, 배송완료 등) 변경
    </td>
  </tr>
  <tr>
    <td>매출관리</td>
    <td>
      - 선택한 기간(월별, 일별) 동안의 매출 통계 그래프(Apexcharts)로 구현<br/>
    </td>
  </tr>
  <tr>
    <td>쿠폰관리</td>
    <td>쿠폰관리</td>
    <td>
      - 사용자에게 제공할 쿠폰 등록(사용기간, 쿠폰명, 할인율, 적용품목 입력)<br/>
      - 쿠폰 수정, 삭제 구현
    </td>
  </tr>
  <tr>
    <td rowspan="3">문의관리</td>
    <td>1:1문의관리</td>
    <td>
      - 유형 카테고리(교환/환불, 결제관련, 기타)별 검색(제목, 작성자, 등록일) 구현<br/>
      - 미답변 문의에 대한 답변등록 구현, 답변완료된 문의는 수정가능<br/>
      - 미답변 문의 버튼 클릭시 미답변 문의 출력 구현
    </td>
  </tr>
  <tr>
    <td>공지사항 관리</td>
    <td>
      - 공지사항 등록, 수정, 삭제 구현
    </td>
  </tr>
  <tr>
    <td>FAQ 관리</td>
    <td>
      - 자주묻는질문 임의로 등록, 수정, 삭제 구현
    </td>
  </tr>
  <tr>
    <td>리뷰관리</td>
    <td>리뷰관리</td>
    <td>
      - 최신순, 평점순 정렬 구현<br/>
      - 상품 카테고리별 검색 구현<br/>
      - 등록된 리뷰 삭제 구현
    </td>
  </tr>
  <tr>
    <td rowspan="2">이벤트관리</td>
    <td>이벤트</td>
    <td>
      - 이벤트 페이지에 사용될 이미지 업로드(이벤트 등록)<br/>
      - 현재 진행중인 이벤트 목록 출력 및 수정, 삭제
    </td>
  </tr>
  <tr>
    <td>타임세일</td>
    <td>
      - 타임세일에 사용될 상품 등록 및 가격 적용 구현<br/>
      - 목록 출력 및 상품번호, 상품명별 검색 구현
    </td>
  </tr>
</table>

## 개발환경
### FRONT-END
<img src="https://user-images.githubusercontent.com/76992948/121053555-72647300-c7f6-11eb-93c7-8a0695eb2528.PNG" alt="html_js_css" width="120"> <img src="https://user-images.githubusercontent.com/76992948/121053565-7395a000-c7f6-11eb-98a5-e4f3a610c58b.PNG" alt="jquery" width="100"> <img src="https://user-images.githubusercontent.com/76992948/121053548-71334600-c7f6-11eb-8d2f-2b56752b4606.PNG" alt="ajax" width="126">

### BACK-END
<img src="https://user-images.githubusercontent.com/76992948/121053561-72fd0980-c7f6-11eb-80ee-90693395cde2.PNG" alt="java" width="100"> <img src="https://user-images.githubusercontent.com/76992948/121053566-7395a000-c7f6-11eb-8e44-a8593a399d54.PNG" alt="jsp" width="120"> <img src="https://user-images.githubusercontent.com/76992948/121053570-742e3680-c7f6-11eb-84b9-b06da68854e3.PNG" alt="mybatis" width="120"> <img src="https://user-images.githubusercontent.com/76992948/121053573-74c6cd00-c7f6-11eb-82e6-bf70c9dbb04a.PNG" alt="spring" width="120"> <img src="https://user-images.githubusercontent.com/76992948/121053581-755f6380-c7f6-11eb-82d3-2253b8679982.PNG" alt="tomcat" width="120">

### DATABASE
<img src="https://user-images.githubusercontent.com/76992948/121053552-71cbdc80-c7f6-11eb-9bb7-6dc14a76c103.jpg" alt="exerd" width="150" height="50"> <img src="https://user-images.githubusercontent.com/76992948/121053571-742e3680-c7f6-11eb-95b1-917769daa35d.PNG" alt="oracle" width="120"> <img src="https://user-images.githubusercontent.com/76992948/121053576-74c6cd00-c7f6-11eb-9ed6-a424f25110a7.PNG" alt="sqldeveloper" width="100">

### IDE/Co-op
<img src="https://user-images.githubusercontent.com/76992948/121056523-3ed71800-c7f9-11eb-8e7a-6dfe972250a0.png" alt="eclipse" width="150"> <img src="https://user-images.githubusercontent.com/76992948/121056539-41397200-c7f9-11eb-8f35-21df41c8b474.png" alt="sts" width="120"> <img src="https://user-images.githubusercontent.com/76992948/121053557-72fd0980-c7f6-11eb-9328-b6e6726f8c65.PNG" alt="git" width="120">

## 사용 API
### Google Maps
* About us 페이지 오프라인 매장 구현
### Summernote
* 게시판 글등록 구현
### Apexcharts
* 수익 통계 그래프 구현
### INIAPI
* 결제 구현
### 카페24 sms api
* 휴면회원 등 문자발송 구현
