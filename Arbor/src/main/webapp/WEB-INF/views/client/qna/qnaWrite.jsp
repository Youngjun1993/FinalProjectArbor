<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="y_qnaWrite_Wrap" class="w1400_container clearfix"> 
        <div id="y_leftMenu">
            <ul>
                <li class="y_title_fs25">My Page</li>
                <li><a href="#">구매내역</a></li>
                <li><a href="#">회원정보수정</a></li>
                <li><a href="#">리뷰관리</a></li>
                <li><a href="#">1:1문의</a></li>
                <li><a href="#">쿠폰내역</a></li>
                <li><a href="#">적립금내역</a></li>
                <li><a href="#">회원탈퇴</a></li>
            </ul>
        </div>
        <div id="y_write_rightcon" class="y_rightcon">
            <p class="y_title_fs25">1:1문의(Q&#38;A) 작성하기</p>
            <form method="post" action="/client/qna/qnaList">
                <div>
                	<p>제목 <span class="colorRed">*</span>
                    <p>
                        <select name="qnacate" id="qnacate">
                            <option value="">카테고리</option>
                            <option value="결제관련">결제관련</option>
                            <option value="배송문의">배송문의</option>
                            <option value="교환/반품">교환/반품</option>
                            <option value="기타">기타</option>
                        </select>
                        <input type="text" name="qnasubject" id="qnasubject" onfocus="this.value=''; return true" value="제목을 입력하세요" />
                    </p>
                    <p>내용 <span class="colorRed">*</span></p>
                    <p>
                        <textarea name="qnacontent" id="qnacontent"></textarea>
                        <script>          
                            CKEDITOR.replace('qnacontent'
                                    , {height: 350
                            });
                        </script>
                    </p>
                </div>
                <input type="submit" name="y_insertBtn" id="y_insertBtn" value="등록하기" />
            </form>
        </div>
    </div>