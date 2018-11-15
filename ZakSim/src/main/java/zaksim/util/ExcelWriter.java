package zaksim.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import zaksim.dto.CStatistics;
import zaksim.dto.MStatistics;
import zaksim.dto.PStatistics;

public class ExcelWriter {
	
	public void memberExcelDown(HttpServletResponse response, List<MStatistics> detailList) {
		
		
		 // 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sheet = wb.createSheet("회원 통계");
		XSSFRow row = null;
		XSSFCell cell = null;
	    int rowNo = 0;
	    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	    String date1 = format.format(new Date());
	    String date2 = format.format(detailList.get(0).getToday()) + " ~ " + format.format(detailList.get(detailList.size()-1).getToday());
	    
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	   
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

	    // 테두리
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    bodyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
	    
	    
	    // 첫번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(0,0,0,4));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("회원 관리 통계");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    
	    // 두번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(1,1,0,1));
	    sheet.addMergedRegion(new CellRangeAddress(1,1,2,4));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("작성 날짜");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(bodyStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue(date1);
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(bodyStyle);
	    
	    // 세번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(2,2,0,1));
	    sheet.addMergedRegion(new CellRangeAddress(2,2,2,4));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("통계 자료 기간");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(bodyStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue(date2);
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(bodyStyle);
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(bodyStyle);
	    

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("날짜");

	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("총 회원수");

	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가입 인원");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("탈퇴 인원");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("방문수");
	    

	    // 데이터 부분 생성
	    for(MStatistics list : detailList) {
	        row = sheet.createRow(rowNo++);
	        
	        cell = row.createCell(0);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(format.format(list.getToday()));

		    cell = row.createCell(1);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getTodayCount());

		    cell = row.createCell(2);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getJoinCount());
		    
		    cell = row.createCell(3);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getJoinCount()-(list.getTodayCount()-list.getYesterdayCount()));
		    
		    cell = row.createCell(4);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getVisits());
	    }
	    
	    for (int i=0; i<=4; i++){
	    	sheet.autoSizeColumn(i);
	    	sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+(short)1024);
	    }


	    
	    // 입력된 내용 파일로 쓰기
        File file = new File("D:\\회원통계_" + format.format(new Date()) +".xlsx");
        FileOutputStream fos = null;
        
        try {
            fos = new FileOutputStream(file);
            wb.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if(wb!=null) wb.close();
                if(fos!=null) fos.close();
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		
	}
	
	public void challengeExcelDown(HttpServletResponse response, List<CStatistics> detailList) {	
		
		 // 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sheet = wb.createSheet("도전 통계");
		XSSFRow row = null;
		XSSFCell cell = null;
	    int rowNo = 0;
	    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	   
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

	    // 테두리
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    bodyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
	    
	    
	    // 첫번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("도전 관리 통계");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    
	    // 두번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(1,1,0,1));
	    sheet.addMergedRegion(new CellRangeAddress(1,1,2,3));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("작성 날짜");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(bodyStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue(format.format(new Date()));
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(bodyStyle);
	    
	    // 세번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(2,2,0,1));
	    sheet.addMergedRegion(new CellRangeAddress(2,2,2,3));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("통계 자료 기간");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(bodyStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue(format.format(detailList.get(0).getToday()) + " ~ " + format.format(detailList.get(detailList.size()-1).getToday()));
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(bodyStyle);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("날짜");

	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("총 회원수");

	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("신청 도전수");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("평균 도전금(원)");
	    

	    // 데이터 부분 생성
	    for(CStatistics list : detailList) {
	        row = sheet.createRow(rowNo++);
	        
	        cell = row.createCell(0);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(format.format(list.getToday()));

		    cell = row.createCell(1);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getTotalMem());

		    cell = row.createCell(2);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getChalCount());
		    
		    cell = row.createCell(3);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getAvgMoney());
	    }
	    
	    for (int i=0; i<=3; i++){
	    	sheet.autoSizeColumn(i);
	    	sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+(short)1024);
	    }


	    
	    // 입력된 내용 파일로 쓰기
       File file = new File("D:\\도전통계_" + format.format(new Date()) +".xlsx");
       FileOutputStream fos = null;
       
       try {
           fos = new FileOutputStream(file);
           wb.write(fos);
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       } finally {
           try {
               if(wb!=null) wb.close();
               if(fos!=null) fos.close();
               
           } catch (IOException e) {
               e.printStackTrace();
           }
       }
		
	}
	
	public void profitsExcelDown(HttpServletResponse response, List<PStatistics> detailList) {	
		
		 // 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sheet = wb.createSheet("기부현황 통계");
		XSSFRow row = null;
		XSSFCell cell = null;
	    int rowNo = 0;
	    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	   
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    headStyle.setVerticalAlignment(VerticalAlignment.CENTER);

	    // 테두리
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    bodyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
	    

	    // 첫번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("기부 현황 통계");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    
	    // 두번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(1,1,0,1));
	    sheet.addMergedRegion(new CellRangeAddress(1,1,2,3));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("작성 날짜");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(bodyStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue(format.format(new Date()));
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(bodyStyle);
	    
	    // 세번째 줄
	    row = sheet.createRow(rowNo++);
	    
	    sheet.addMergedRegion(new CellRangeAddress(2,2,0,1));
	    sheet.addMergedRegion(new CellRangeAddress(2,2,2,3));
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue("통계 자료 기간");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(bodyStyle); //위에서 설정한셀 스타일 셋팅
	    cell.setCellValue(format.format(detailList.get(0).getToday()) + " ~ " + format.format(detailList.get(detailList.size()-1).getToday()));
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(bodyStyle);
	    

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("날짜");

	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("종료 도전수");

	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("실패 도전수");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("예비 기부금(원)");
	    

	    // 데이터 부분 생성
	    for(PStatistics list : detailList) {
	        row = sheet.createRow(rowNo++);
	        
	        cell = row.createCell(0);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(format.format(list.getToday()));

		    cell = row.createCell(1);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getEndChal());

		    cell = row.createCell(2);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getFailChal());
		    
		    cell = row.createCell(3);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(list.getMoney());
	    }
	    
	    for (int i=0; i<=3; i++){
	    	sheet.autoSizeColumn(i);
	    	sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+(short)1024);
	    }


	    
	    // 입력된 내용 파일로 쓰기
       File file = new File("D:\\기부현황통계_" + format.format(new Date()) +".xlsx");
       FileOutputStream fos = null;
       
       try {
           fos = new FileOutputStream(file);
           wb.write(fos);
       } catch (FileNotFoundException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       } finally {
           try {
               if(wb!=null) wb.close();
               if(fos!=null) fos.close();
               
           } catch (IOException e) {
               e.printStackTrace();
           }
       }
		
	}

}
