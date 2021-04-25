<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>데려다줄개 - 관리자 페이지</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
      crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" href="${path}/css/headerfooter.css"/>
    <link rel="stylesheet" href="${path}/css/adminpage.css"/>
    <script src="${path}/js/jquery-3.5.1.js"></script>

  </head>
  <body>
 
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/nav.jsp" />
    <section>
      <div class="container d-flex mx-0 p-0">
        <!-- 건들지마세요 -->
        <!-- 건들지마세요 -->
        <!-- 건들지마세요 -->
        <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
 
  <jsp:include page="../common/adminSideBar.jsp" />
        <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->
        <!-- 여기까지 건들지마세요-->

        <div class="container mx-0 p-3" style="width: 1120px">
          <div class="container d-flex row mx-3 p-0">
            <!-- 여기서 부터 작업하세용 -->
            <!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
            <div class="container">
              <div class="col-xs-12">
                <div class="card border-dark mb-3 admin-box__elements">
                  <div class="card-header fs-4 fw-bolder admin__elements">
                    통계
                  </div>
                  <div class="card-body text-dark">
                    
                    <div class="row d-flex justify-content-center">
                      <div class="col-md-12 row mb-3" style="border: 1px ridge;">
                      	<p class="col-md-12 fw-bold h5 my-2 p-2" 
                      		style="background-color: rgb(0,0,0,0.15);">
                      			방문자수		
                      	</p>
                      	<div class="col-md-12" id="chart_visitor" style="height: 300px; width: 900px"></div>
                      </div>
                      
                      <div class="col-md-12 row mb-3" style="border: 1px ridge;">
                      	<p class="col-md-12 fw-bold h5 my-2 p-2" 
                      		style="background-color: rgb(0,0,0,0.15);">
                      			가입자수		
                      	</p>
                      	<div class="col-md-12" id="chart_member" style="height: 300px; width: 900px"></div>
                      </div>
                   
                      <div class="col-md-12 row mb-3" style="border: 1px ridge;">
                      	<p class="col-md-12 fw-bold h5 my-2 p-2" 
                      		style="background-color: rgb(0,0,0,0.15);">
                      			카테고리별 제휴업체		
                      	</p>
                      	<div class="col-md-12" id="barchart_partner"></div>
                      </div>
                      <div class="col-md-12 row mb-3" style="border: 1px ridge;">
                      	<p class="col-md-12 fw-bold h5 my-2 p-2" 
                      		style="background-color: rgb(0,0,0,0.15)">
                      			콜 수		
                      	</p>
                      	<div class="col-md-12" id="call_chart" style="height: 300px; width: 800px"></div>
                      </div>                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12">
                  <div class="card border-dark mb-3 admin-box__elements">
                    <div class="card-header fs-4 fw-bolder admin__elements">
                      회원 정보
                    </div>
                    <div class="card-body text-dark">
	                    <div class="d-flex justify-content-between">
	                      <div>
	                      	  <button class="btn btn-outline-info" 
	                      	  		  onclick="location.href='${path}/admin/info'">
	                      	  	전체보기
	                      	  </button>                      
	                      </div>
	                      <div class="d-flex mb-3 justify-content-end">
		                      <div class="input-group " style="width: 100px">
		                          <select class="form-select" name="searchType" id="searchType">
		                            <option value="userId">id</option>
		                            <option value="userName">이름</option>
		                          </select>
		                      </div>
		                      <div class="input-group input-group-sm" style="width: 250px">
		                          <input type="text" class="form-control" name="keyword" id="keyword" />
		                          <button class="btn btn-info" id="btnSearch" name="btnSearch">검색</button>
		                      </div>
	                      </div>                
	                    </div>
                      <table class="table table-striped">
                        <thead>
                          <tr class="text-center">
                            <th scope="col">No</th>
                            <th scope="col">타입</th>
                            <th scope="col">아이디</th>
                            <th scope="col">이름</th>
                            <th scope="col">연락처</th>
                            <th scope="col">애견정보</th>
                            <th scope="col">가입상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${empty memberList}">                       	
	                        	<tr>
	                        		<td class="text-center fw-bold" colspan="7">
	                        			회원이 존재하지 않습니다.
	                        		</td>
	                        	</tr>
                        	</c:if>
                        	
                        	<c:if test="${memberList != null}">
                        		<c:forEach var="member" items="${memberList}">
				                    <tr class="text-center">
				                 	    <td>${member.rowNum}</td>
					                    <td>${member.userType}</td>
					                    <td>${member.userId}</td>
					                    <td>${member.userName}</td>
					                    <td>${member.phone}</td>
					                    <c:if test="${empty member.dog.dogName}">
					                    <td>X</td>
					                    </c:if>
					                    <c:if test="${!empty member.dog.dogName}">
					                    <td>${member.dog.dogName}</td>					                    
					                    </c:if>
					                    <td>${member.status}</td>
				                    </tr>                        		
                        		</c:forEach>
                        	</c:if>
                        </tbody>
                      </table>
                      
                      <!-- 페이징 부분 -->
                      <div
                        aria-label="Page navigation example"
                        class="d-flex justify-content-center"
                      >
                        <ul class="pagination">
                          
                          <!-- 맨 처음으로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info?page=1" aria-label="Previous">
                              <span aria-hidden="true">&lt;&lt;</span>
                            </a>
                          </li>
                          <!-- 이전 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info?page=${pageInfo.prvePage}" aria-label="Previous">
                              <span aria-hidden="true">&lt;</span>
                            </a>
                          </li>
                          
                          <!-- 5개 페이지 목록 -->
                          <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status" >                          
                          	<c:if test="${status.current == pageInfo.currentPage}">
	                          <li class="page-item">
	                            <a class="page-link disabled"><c:out value="${status.current}"/></a>
	                          </li>
                          	</c:if>
                          	<c:if test="${status.current != pageInfo.currentPage}">
	                          <li class="page-item">
		                      	<a class="page-link" href="${path}/admin/info?page=${status.current}&searchType=${pageInfo.searchType}&keyword=${pageInfo.keyword}"><c:out value="${status.current}"/></a>                  
	                          </li>
                          	</c:if>
                          </c:forEach>
                          
                          <!-- 다음 페이지로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info?page=${pageInfo.nextPage}" aria-label="Previous">
                              <span aria-hidden="true">&gt;</span>
                            </a>
                          </li>
                          
                          <!-- 맨 끝으로 -->
                          <li class="page-item">
                            <a class="page-link" href="${path}/admin/info?page=${pageInfo.maxPage}" aria-label="Previous">
                              <span aria-hidden="true">&gt;&gt;</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑-->
            <!-- 여기 까지 -->
          </div>
        </div>
      </div>
    </section>

  <jsp:include page="../common/footer.jsp" />

	<!-- 부트스트랩 이미지 불러오기 위한 경로 -->
    <script
      src="https://kit.fontawesome.com/0fe4d45686.js"
      crossorigin="anonymous"
    ></script>
    
    <!-- 차트 api-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- 방문자수 차트 api -->
    <script type='text/javascript'>
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(visitorChart);
	  
      function visitorChart() {
		  var visitDateCount = "";
    	  
    	  var result;
    	  
    	  var jsonData = $.ajax({
	    	  type: "get",
	    	  async : false,
	    	  url: "${path}/admin/visitChart",
	    	  dataType: "json",
	    	  data: {visitDateCount},
	    	  success: function(data) {
	    		  console.log(data);
	    		  
	    		  var items = new Array();
	    		  
	    		  for (var i = 0; i < data.length; i++) {
	    			  
					items[i] = new Array(new Date(data[i].VISITTIME), data[i].COUNT);
				}
	    		  console.log(items);
	 			  data = items;
	 			  
	 			  result = data;
	 			  console.log(data);
	    	  },
	    	  
	    	  error: function(e) {
	    		  console.log(e);
	    	  }
	    	  
   	  	  });	

    	  console.log(result);

        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', '방문자 수');
   
        data.addRows(result);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_visitor'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>
    
    <!-- 가입자수 차트 api -->
    <script type='text/javascript'>
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(joinChart);
		
            
      function joinChart() {
  
    	  var dateAndCount = "";
    	  
    	  var result;
    	  
    	  var jsonData = $.ajax({
	    	  type: "get",
	    	  async : false,
	    	  url: "${path}/admin/joinChart",
	    	  dataType: "json",
	    	  data: {dateAndCount},
	    	  success: function(data) {
	    		  console.log(data);
	    		  
	    		  var items = new Array();
	    		  
	    		  for (var i = 0; i < data.length; i++) {
	    			  
					items[i] = new Array(new Date(data[i].ENROLLDATE), data[i].COUNT);
				}
	    		  console.log(items);
	 			  data = items;
	 			  
	 			  result = data;
	 			  console.log(data);
	    	  },
	    	  
	    	  error: function(e) {
	    		  console.log(e);
	    	  }
	    	  
   	  	  });	

    	  console.log(result);
 
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', '가입자 수');
     
        data.addRows(result);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_member'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>
    
    <!-- 카테고리별 제휴업체 차트 -->
    <script type="text/javascript">
	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["PartnerType", "Count", { role: "style" } ],
	        ["${pChartList[0].partnerType}", ${pChartCount[0].count}, "#38c970"],
	        ["${pChartList[1].partnerType}", ${pChartCount[1].count}, "#8ba5ed"],
	        ["${pChartList[2].partnerType}", ${pChartCount[2].count}, "#ffea5e"]
	      ]);

	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);

	      var options = {
	        width: 800,
	        height: 300,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	        hAxis: {
	        	format: '#'
	        }
	      };
	      
	      var chart = new google.visualization.BarChart(document.getElementById("barchart_partner"));
	      chart.draw(view, options);
  	}
  	</script>
    
    <!-- 콜 수 차트 -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          		${callStr}
        ]);

        var options = {
          title: '누적 일반콜 & 긴급콜',
          colors: ['#3f51b5', '#c62828'],
          width: 800,
          height: 300,
          chartArea:{left:200,top:80,width:'80%',height:'60%'}
        };

        var chart = new google.visualization.PieChart(document.getElementById('call_chart'));

        chart.draw(data, options);
      }
    </script>
    
    <!-- 검색기능 url만들어주는 부분 -->
    <script>
    	$(document).on('click', '#btnSearch', function(e){
    		e.preventDefault();
    		
    		var url = "${path}/admin/info";
    		
    		url = url + "?searchType=" + $('#searchType').val();
    		
    		url = url + "&keyword=" + $('#keyword').val();
    		
    		location.href = url;
    		
    		console.log(url);
    	});
    </script>
    
  </body>
</html>
