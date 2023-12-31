<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <!-- ***** footer Area Start ***** -->   
  <footer id="footer">
    <div class="container">
      <div class="footer_left">
        <ul>
          <li class="f_logo">
            <img src="/resources/images/logo_text1.svg" alt="footer_logo1">
          </li>
          <li class="f_cs">
          <c:if test="${session.name == null}">
	          <a href="/">
	              <button type="button">고객센터></button>
	          </a>
          </c:if>
            
            <c:if test="${session.name != null}">
			    <form id="removeAccountForm" action="/member/remove_account?id=${session.id}" method="post">
				    <input class="removeId" type="submit" value="회원 탈퇴"><a></a></input>
				</form>
			</c:if>
            <section class="f_time">
              <span>고객센터 1661-8686</span>
              <span>AM10:00 - PM 18:00</span>
            </section>
          </li>
          <li class="f_con">
            <p>
              주식회사 술결 | 공동대표 김지은 채승병 김용학 정주이 김수진 <br>
              본 사이트는 포트폴리오로 상업적 웹사이트와 무관합니다. <br> 
              통신판매 신고번호 2023-서울구로-3 <br>
              <br>
              ⓒSulGyul,Inc. All rights reserved
            </p>
          </li>
        </ul>
      </div>
      <div class="footer_right">
        <div class="get-free-quote">
          <form id="free-quote" method="submit" role="search" action="#">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading-footer">
                  <h2>Contact Us</h2>
                </div>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <input class="search_btn" type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Enter your E-mail Address"
                    required="">
                </fieldset>
                <fieldset>
                  <!-- <input type="button" class="email_btn" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your E-mail"
                    required=""> -->
                    <button>SUBSCIBE NOW</button>
                </fieldset>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </footer>  <!-- ***** footer Area End ***** -->


    <!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/js/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <!-- 
    <script src="/resources/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/datatables-responsive/dataTables.responsive.js"></script>
    -->
    
    <!-- Custom Theme JavaScript -->
    <script src="/resources/js/sb-admin-2.js"></script>

    
   <!-- additional JavaScript -->
   <script src="/resources/js/isotope.min.js"></script>
   <script src="/resources/js/owl-carousel.js"></script>
   <script src="/resources/js/tabs.js"></script>
   <script src="/resources/js/popup.js"></script>
   <script src="/resources/js/custom.js"></script>
    
   

</body>

</html>
