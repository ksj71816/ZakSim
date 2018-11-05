<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
			<div class="row mt-3 mr-2">
				<div class="col-1"></div>
				<div class="col-4 border">
					<div class="row justify-content-center pt-2">
						<p class="align-self-center mt-5" id="joinNum" style="font-size: 70px; font-family: Dohyeon;">${joinNum}</p>
					</div>
					<div class="row justify-content-center mb-3">
						<p style="font-family: Dohyeon;">가입 인원</p>
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
						<button class="btn btn-success" style="background-color: green !important; margin-right: 15px;">
							<i class="fas fa-file-excel"></i> 엑셀 다운로드 
						</button>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			
			
			<!-- table -->
			<div class="row mb-5" style="margin-top: 15px;">
				<div class="col-1"></div>
				<div class="col-10 table-responsive-xl">
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>총 회원수</th>
								<th>가입 인원</th>
								<th>탈퇴 인원</th>
								<th>방문수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>10</td>
								<td>type</td>
								<td>id</td>
								<td>nick</td>
								<td>name</td>
							</tr>
							<tr>
								<td>9</td>
								<td>type</td>
								<td>id</td>
								<td>nick</td>
								<td>name</td>
							</tr>
							<tr>
								<td>8</td>
								<td>type</td>
								<td>id</td>
								<td>nick</td>
								<td>name</td>
							</tr>
							<tr>
								<td>7</td>
								<td>type</td>
								<td>id</td>
								<td>nick</td>
								<td>name</td>
							</tr>
							<tr>
								<td>6</td>
								<td>type</td>
								<td>id</td>
								<td>nick</td>
								<td>name</td>
							</tr>
							<tr>
								<td>5</td>
								<td>type</td>
								<td>id</td>
								<td>nick</td>
								<td>name</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- table -->