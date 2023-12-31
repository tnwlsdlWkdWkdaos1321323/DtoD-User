<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%@include file="../includes/header.jsp" %> 
<link href="/resources/consultation/bootstrap.min.css" rel="stylesheet">
	 <!--get CSS-->
	 <link rel="stylesheet" href="/resources/consultation/get.css">

</head>

<%@ include file="../includes/nav.jsp"%>
    		<div class=container>
 
               <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">문의내용</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                      <div class="panel-heading"></div>                      
                      <div class="panel-body">
                      <div class="form-group">
                          <label>번호</label>
                          <input class="form-control" name="conbno" value='<c:out value="${board.conbno}" />' readonly="readonly">                       
                       </div>
                       <div class="form-group">
                          <label>제목</label>
                          <input class="form-control" name="contitle" value='<c:out value="${board.contitle}" />' readonly="readonly">                       
                       </div>                       
                       <div class="form-group">
                          <label>내용</label>
                          <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.concontent}" /></textarea>
                       </div>
                       <div class="form-group">
                          <label>작성자</label>
                          <input class="form-control" name="writer" value='<c:out value="${board.conwriter}" />' readonly="readonly">                       
                       </div>  
                       <button data-oper='modify' class="btn btn-default" onclick="location.href='/consultation/modify?conbno=<c:out value="${board.conbno}" />'">글내용 수정!</button>
                       <button data-oper='list' class="btn btn-info" onclick="location.href='/consultation/list'">글목록 조회로 Go!</button> 
                       
                       <form id="operForm" action="/consultation/modify" method="get">
	                       <input type="hidden" id='conbno' name="conbno" value="<c:out value="${board.conbno}" />">
	                       <input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}" />">
	                       <input type="hidden" name="amount" value="<c:out value="${cri.amount}" />">
	                      
	                       <!-- Page345 : 15.4.2 조회 페이지에서 검색 처리 아래 2줄 소스 추가 적용 -->
	                       <input type="hidden" name="type" value="<c:out value="${cri.type}" />" />
						   <input type="hidden" name="keyword" value="<c:out value="${cri.keyword}" />" />
                       </form>
                                             
                       </div>
                       <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- Page414 댓글 목록 처리 get jsp 소스 코딩 시작  -->
<!-- 댓글 목록 처리 : 댓글의 목록 처리를 위해서는 별도의 div 태그를 생성해서 처리해야 합니다.
          게시글과 관련된 화면 아래쪽에 div 태그를 추가합니다. 추가하는 div태그에는 나중에 화면의
          모습을 파악할 수 있도록 간단한 텍스트 등을 구성해 봅니다. -->
         
          				
          				<!-- Page439 get.jsp 소스 추가 내용 -->
          				<!-- panel-footer는 댓글이 화면상에서 출력되는 
          				         영역의 아래쪽에 추가해 줍니다. .panel-footer에
          				         댓글 페이지 번호를 출력해 줍니다. -->
          			    <div class="panel-footer">          			    
          			    
          			    </div>  			
          			    
          		</div>	<!-- /.panel panel-default -->
          	</div> <!-- / .col-lg-12 -->  
          </div> <!-- / .row -->
          
          		<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
								<label>Reply</label>
								<input class="form-control" name="reply" value="New Reply!">
								</div>
								<div class="form-group">
								<label>Replyer</label>
								<input class="form-control" name="replyer" value="replyer">
								</div>
								<div class="form-group">
								<label>Reply Date</label>
								<input class="form-control" name="replyDate" value="">
								</div>				
							</div>
							<div class="modal-footer">
								<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
								<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
								<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>								
								<button id="modalCloseBtn" type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>								
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->            
            	</div>
            <script type="text/javascript" src="/resources/js/reply.js"></script>
            <script type="text/javascript">            
            // Page404 연습할 때 아래 3줄 구문은 주석 처리합니다.
            // $(document).ready(function() {			
            	// console.log(replyService);
			// });
            /*
            console.log("=============================");
            console.log("Javascript TEST");
            */            
            
         // 특정 게시물의 댓글 관련 이벤트 처리 : 게시글의 조회 페이지가 열리면 자동으로 댓글 목록을 가져와서
         // li 태그를 구성해야 합니다. 이에 대한 처리는 $(documnet).ready() 내에서 이루어지게 합니다.
         // Page415 이벤트 처리를 위한 자바스크립트 소스 코딩 시작
         $(document).ready(function() {
            var bnoValue = '<c:out value = "${board.conbno}" />';
            var replyUL = $(".chat");
            
        	// showList() 메서드는 페이지 번호를 파라미터로 받도록 하며,
        	// 만일 파라미터가 없는 경우에는 자동으로 1페이지가 되도록 설정합니다.
        	// 웹브라우저에서 DOM 처리가 끝나면 자동으로 showList() 메서드가 호출되면서
        	// ul 태그 내에 내용으로 처리됩니다. 만약 1페이지가 아닌 경우라면
        	// 기존 ul태그에 li태그들이 추가되는 형태입니다.
            showList(1);
        	
        	
        	function showList(page) {
        		
        		console.log("showList() 메서드 호출 list = " + page);
        		
        		replyService.getList({bno:bnoValue, page: page|| 1}, function(replyCnt, list) {
        			
        			console.log("replyCnt = " + replyCnt);
        			console.log("list = " + list);

        			// 위에서 showList() 함수가 파라미터로 전달되는 page 변수를
        			// 이용해서 원하는 댓글 페이지를 가져오게 되면, 이때, 만약(if)
        			// page 번호가 '-1'로 전달되면 마지막 페이지를 찾아서 다시 호출하게 됩니다.
        			if(page == -1){
        				pageNum = Math.ceil(replyCnt/10.0);
        				showList(pageNum);
        				return;
        			}
        			
        			var str = "";
        			if(list == null || list.length == 0){
        				replyUL.html("");
        				return;
        			}
        			for(var i = 0, len = list.length||0; i < len; i++){
    					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
    					str += "  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
    					
    					// Page418~Page419 소스 코딩할 때 아래 내용은 주석 처리해 줍니다.
    					/*
    					str += "     <small class='pull-right text-muted'>"+list[i].replyDate+"</small></div>";
    					*/
    					
    					// Page418~Page419 get.jsp 소스 코딩 수정 적용 시작
    					str += "     <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
    					
    					str += "      <p>"+list[i].reply+"</p></div></li>";    					    					
    				}
        			
        			replyUL.html(str); 
        			
        			// Page441 아래 1줄 소스 추가함
        			showReplyPage(replyCnt);
        			
        			}); // end function
    			} // end showList
    			
    			// Page440 get.jsp 소스 코딩 : 앞서 div class='panel-footer'에 댓글
    			// 페이지 번호를 출력하는 로직인 showReplyPage() 메서드를 정의해 줍니다.   			
    			var pageNum = 1;
        		var replyPageFooter = $(".panel-footer");
        		
        		function showReplyPage(replyCnt) {
					var endNum = Math.ceil(pageNum/10.0)*10;
					var startNum = endNum -9;
					var prev = startNum !=1;
					var next = false;
					
					if(endNum * 10 >= replyCnt){
						endNum = Math.ceil(replyCnt/10.0);
					}
					
					if(endNum * 10 < replyCnt){
						next = true;
					}					
					var str = "<div><ul class = 'pagination pull-right'>";					
					if(prev){
						str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
					}
					for(var i = startNum; i <= endNum; i++){
						var active = pageNum == i ? "active" : "";
						str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>" + i + "</a></li>";
					}
					if(next){
						str += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
					}
					str += "</ul></div>";
					console.log(str);
					replyPageFooter.html(str);
					}
        		
					// Page 441 : 마지막 처리는 replyPageFooter를 활용해서 
					//            페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 합니다.					
					replyPageFooter.on("click", "li a", function(e) {
					// 댓글의 페이지 번호는 a 태그 내에 존재하므로 이벤트 처리에서는
					// a 태그의 기본 동작을 제한하고(preventDefault()) 댓글 페이지 번호를
					// 변경한 후에 해당 페이지의 댓글을 가져오도록 합니다.	
						e.preventDefault();
						console.log("page click");
						var targetPageNum = $(this).attr("href");
						console.log("targetpageNum = " + targetPageNum);
						pageNum = targetPageNum;
						showList(pageNum);
					});					
    			

    			// Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 시작
    			// 새로운 댓글의 추가 시, 버튼 이벤트 처리 : 댓글 목록 상단의 'New Reply'를 클릭하면
    			// 화면에서는 모달창을 보여줘서 처리합니다. 모달과 관련된 객체들은 여러 함수에서 사용할 것이므로
    			// 바깥쪽으로 빼두어 매번 jQuery를 호출하지 않도록 합니다.
    			var modal = $(".modal");
    			var modalInputReply = modal.find("input[name='reply']");
    			var modalInputReplyer = modal.find("input[name='replyer']");
    			var modalInputReplyDate = modal.find("input[name='replyDate']");
    			
    			var modalModBtn = $("#modalModBtn");
    			var modalRemoveBtn = $("#modalRemoveBtn");
    			var modalRegisterBtn = $("#modalRegisterBtn");
    			
    			// 사용자가 'New Reply' 버튼을 클릭하면 입력에 필요없는 항목들은 안 보이게 처리하고,
    			// 모달창을 보이게 합니다.
    			$("#addReplyBtn").on("click", function(e) {
					modal.find("input").val("");
					// 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
					modalInputReplyDate.closest("div").hide();
					// 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
					modal.find("button[id != 'modalCloseBtn']").hide();
					
					modalRegisterBtn.show();
					$(".modal").modal("show");
				});
    			// Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 끝    			
	
    			// Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 시작
				// 새로운 댓글의 추가는 필요한 댓글의 내용(Reply)과 댓글의 작성(Replyer) 항목만으로
				// 추가해서 모달창 아래쪽의 'Register' 버튼을 클릭해서 처리하게 합니다.
    			modalRegisterBtn.on("click", function(e) {
					var reply = {
							reply : modalInputReply.val(),
							replyer : modalInputReplyer.val(),
							bno : bnoValue
					};
					// 댓글이 정상적으로 추가되면 경고창(alert)을 이용해서 성공했다는 사실을 알려주고,
					// 등록한 내용으로 다시 등록할 수 없도록 입력항목을 비우고 모달창을 닫아줍니다.
					replyService.add(reply, function(result) {
						alert(result);
						modal.find("input").val("");
						modal.modal("hide");
						// 댓글이 정상적으로 처리되었지만 목록 자체는 갱신된 적이 없으므로
						// 화면에서 새로 등록된 댓글이 보이지 않습니다. 이러한 문제 때문에
						// 댓글을 추가한 후에는 다시 댓글의 목록(showList(1)) 갱신 처리를 해줍니다.
						// 아래와 같이 showList(1)을 추가해 줘서 댓글이 추가된 후
						// 그 사이에 추가되었을지 모르는 새로운 댓글도 가져오도록 합니다.
						// 웹프로젝트 실행 후 New Reply!!! 버튼 클릭하고, 댓글 입력 후
						// 댓글 리스트 하단에 댓글 추가 내용과 우측 댓글 추가 시간을 확인하시기 바랍니다.
						// showList(1);
						
						
						showList(-1); // Page438, Page439 : 위에서 사용자가 새로운 댓글을
			              // 추가하면 showList(-1);을 호출하여 우선 전체 댓글의
			              // 숫자를 파악하게 합니다. 이후에 다시 마지막 페이지를 호출해서
			              // 이동시키는 방식으로 동작하게 됩니다. 이러한 방식은 여러 번
			              // 서버를 호출해야 하는 단점이 있기는 하지만, 댓글의 등록 행위가
			              // 댓글 조회나 페이징에 비해서 적기 때문에 심각한 문제는 아닙니다.
					});
				});
    			// Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 끝
    			
    			// Page 425 : 댓글 조회 클릭 이벤트 처리
				// 특정한 댓글 조회 클릭 이벤트 처리
				// Ajax로 댓글을 조회한 후 수정/삭제를 처리하게 합니다.
				// 댓글을 가져온 후에는 필요한 항목들을 채우고 수정과 삭제가 필요한 댓글 번호(rno)는
				// 'data-rno' 속성을 만들어서 추가해 둡니다.
    			$(".chat").on("click", "li", function(e) {
					var rno = $(this).data("rno");
					replyService.get(rno, function(reply) {
						modalInputReply.val(reply.reply);
						modalInputReplyer.val(reply.replyer);
						modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
						
						modal.data("rno", reply.rno);
						modal.find("button[id != 'modalCloseBtn']").hide();
						modalModBtn.show();
						modalRemoveBtn.show();
						
						$(".modal").modal("show");
					});
				});
    			
    			// Page426~ Page427 댓글의 수정 이벤트 처리
    			// 댓글의 수정 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
    			// 댓글의 수정은 댓글(reply)만 수정이 가능합니다. 왜냐하면 ReplyMapper.xml에서
    			// update 처리가 댓글(reply)만 수정 적용하게 되어 있기 때문입니다.
    			modalModBtn.on("click", function(e) {
					var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
					replyService.update(reply, function(result) {
						alert(result);
						modal.modal("hide");
						// Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
						// showList(1);
						showList(pageNum); // Page442 showList() 메서드를 호출할 때
						// 현재 보고 있는 댓글 페이지의 번호를 호출합니다.						
					});
				});
    			
    			// Page427 댓글의 삭제 이벤트 처리
    			// 댓글의 삭제 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
    			// 댓글 삭제 역시 모달창에 있는 'data-rno'값을 이용해서 처리합니다.
    			modalRemoveBtn.on("click", function(e) {
					var rno = modal.data("rno");
					replyService.remove(rno, function(result) {
						alert(result);
						modal.modal("hide");
						// Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
						// showList(1);
						showList(pageNum); // Page442 showList() 메서드를 호출할 때
						// 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
					});
				});
         });
            
          
            
            </script>
            
            
            <script type="text/javascript">
            	$(document).ready(function() {
            		
            		var operForm = $("#operForm");
            		
            		$("button[data-oper='modify']").on("click", function(e) {
            			operForm.attr("action", "/consultation/modify").submit();			
					});
            		
					$("button[data-oper='list']").on("click", function(e) {
						operForm.find("#bno").remove();
						operForm.attr("action", "/consultation/list")
						operForm.submit();
					});
				});
            
            </script>
            
            
            
            
<%@ include file="../includes/footer.jsp" %>