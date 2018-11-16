package zaksim.challenge.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zaksim.dao.ChallengeDao;
import zaksim.dto.Challenge;

@Service
public class ChallengeInfoServiceImpl implements ChallengeInfoService {

	@Autowired ChallengeDao chalDao;
	
	@Override
	public Challenge getChallengeInfo(int memberIdx) {
	
		System.out.println("service : "+memberIdx);
		
		return chalDao.selectChallenge(memberIdx);
	}

	@Override
	public void discardChallenge(Challenge chal) {
		chalDao.updateChallenge(chal);
		
	}

	@Override
	public int dateColculation(Date nDate) {
		
		
	    // 현재날짜 구하기
//	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	    String date = format.format(new Date());
//	    System.out.println("현재시간 년월일 = " + date);
	 
	    // 현재시각까지
//	    SimpleDateFormat fm2= new SimpleDateFormat(
//	            "yyyy-MM-dd HH:mm:ss");
//	    String dateTime= fm2.format(new Date());
//	    System.out.println("현재시간 시분초 = " + dateTime);

	    // 매개변수 Date타입을 String타입 변환
//	    String colDate = format.format(nDate);
	    
		//매개변수 Date타입 이므로 생략
		
		
//		특정 날짜 두개에서 그 차이값을 알고 싶을 때 사용할수 있는 방법입니다. 
//		먼저 String 으로 되어 있는 날짜를 SimpleDateFormat 이용해서 Date 객체로 바꿉니다. 
//		Date 객체의 getTime() 은 시간을 long 값으로 계산해서 리턴해줍니다.
//		2개의 long 값을 빼면 시간차가 나오는데 이것을 하루 단위로 바꾸기 위해 
//		24(시간) * 60(분) * 60(초) * 1000(1000 분의 1) 곱한값을 나눕니다.

		
		
		
		
		
		// 현재 날짜
		Date nowDate = new Date();
		System.out.println(nowDate);
		
		long diff = nowDate.getTime() - nDate.getTime();
		System.out.println("날짜 비교 long타입 : "+diff);
		
		long diffDays = diff / (24 * 60 * 60 * 1000);
		System.out.println("날짜 차이 : " + diffDays);
		
		int result = (int)diffDays;
		System.out.println("최종결과 : "+result);
		
		return result;
	}

}
