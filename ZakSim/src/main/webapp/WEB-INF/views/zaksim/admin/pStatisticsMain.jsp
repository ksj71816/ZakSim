<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
			<div class="row mt-3 mr-2">
				<div class="col-1"></div>
				<div class="col-4 border">
					<div class="row justify-content-center pt-2 pl-3 pr-3" id="rateDiv">
						<canvas id="rateChart" width="300" height="200"></canvas>
					</div>
					<div class="row justify-content-center mb-3">
						<p style="font-family: Dohyeon;">도전 성공률</p>
					</div>
				</div>
				<div class="col-6 border ml-2" id="canvasDiv">
					<canvas id="myChart" width="400" height="180"></canvas>
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row" style="margin-top: 120px;">
				<div class="col-11">
					<div class="row justify-content-end">
						<button class="btn btn-success" style="background-color: green !important; margin-right: 15px;" onclick="excelDown();">
							<i class="fas fa-file-excel"></i> 엑셀 다운로드 
						</button>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			
			
			<!-- table -->
			<div class="row mb-5" style="margin-top: 15px;">
				<div class="col-1"></div>
				<div class="col-10 table-responsive-xl" style="max-height: 500px; overflow: auto;">
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>종료 도전수</th>
								<th>실패 도전수</th>
								<th>예비 기부금(원)</th>
							</tr>
						</thead>
						<tbody id="detailTable">
						</tbody>
					</table>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- table -->