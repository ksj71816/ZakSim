package zaksim.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import zaksim.dto.MStatistics;

public class ExcelWriter {
	
	public void memberExcelDown(HttpServletResponse response, List<MStatistics> detailList) {	
		
		 // 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sheet = wb.createSheet("회원 통계");
		XSSFRow row = null;
		XSSFCell cell = null;
	    int rowNo = 0;
	    
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	   
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.BRIGHT_GREEN.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 테두리
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    

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
	    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

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
        File file = new File("C:\\Users\\olaf\\Desktop\\회원통계_" + format.format(new Date()) +".xlsx");
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
