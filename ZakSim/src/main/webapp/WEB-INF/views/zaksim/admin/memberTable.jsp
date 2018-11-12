<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!-- table -->
			<div class="row" style="margin-top: 15px;">
				<div class="col-1"></div>
				<div class="col-10 table-responsive-xl">
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th><input type="checkbox" name="checkAll"/></th>
								<th style="display: none;">idx</th>
								<th>No.</th>
								<th>type</th>
								<th>ID</th>
								<th>Nick</th>
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Join Date</th>
								<th>Status</th>
								<th>Suspension Date</th>
								<th>계정 정지 횟수</th>
								<th>신고 횟수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${ mList }" var="member">
							<tr>
								<th scope="row">
									<input type="checkbox" name="checkOne"/>
								</th>
								<td style="display: none;">${member.idx}</td>
								<td>${member.rnum}</td>
								<td>${member.memberType}</td>
								<td>${member.id}</td>
								<td>${member.nick}</td>
								<td>${member.name}</td>
								<td>${member.email}</td>
								<td>${member.phone}</td>
								<td>
									<fmt:formatDate pattern = "yyyy-MM-dd" value = "${member.joinDate}" />
								</td>
								<td>${member.status}</td>
								<c:if test="${empty member.suspensionDate }">
									<td>-</td>
								</c:if>
								<c:if test="${not empty member.suspensionDate }">
									<td>${member.suspensionDate}</td>								
								</c:if>
								<td>${member.suspendNum}</td>
								<td><span class="data-span-modal">${member.reportNum}</span></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- table -->
			
			<!-- pagination -->
			<%@include file="./paging/memberPaging.jsp" %>
          <!-- pagination -->
          
          