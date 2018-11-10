package zaksim.login.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import zaksim.dao.ZakSimMemberDao;
import zaksim.dto.ZakSimMember;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 회원 관련 서비스
 * @param <JavaMailSender>
 */
@Service
public class ZakSimMemberServiceImpl implements ZakSimMemberService {

	@Autowired ZakSimMemberDao memberDao;
	
	// 이메일 발송 관련
	@Autowired private JavaMailSender mailSender; // mail sender
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	private String from = "kmh.finaltest@gmail.com"; // 보내는 사람(이메일 서버 설정한 아이디로 함.)
	

	@Override
	public boolean login(ZakSimMember memberDto) {
		
		if( memberDao.login(memberDto) == 1 ) {
			return true;
		} else {
			return false;			
		}
	}
	
	@Override
	public ZakSimMember memberInfo(ZakSimMember memberDto) {
		return memberDao.memberInfo(memberDto);
	}

	@Override
	public String findId(String name, String email) {
		Map<String, String> map = new HashMap<>();
		
		map.put("name", name);
		map.put("email", email);
		
		return memberDao.findId(map);
	}

	@Override
	public String findPw(String id, String name, String email) {
		String ranPw = null;
		
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		if ( memberDao.findPw(map) == 1 ) {
			// 해당 회원이 있을 경우, 임시 비밀번호 저장 및 이메일로 발송
			String title = "[ZakSim] 임시 비밀번호입니다."; // 이메일 제목
			
			ranPw = UUID.randomUUID().toString().replaceAll("-", ""); // - 제거
			ranPw = ranPw.substring(0, 10);
			String content = "임시 비밀번호는 [ " + ranPw + " ] 입니다."; // 이메일 내용
			
			System.out.println("생성된 임시 비밀번호 : " + ranPw);
			
			// 이메일 보내기 설정
			try {
				message = mailSender.createMimeMessage();
				messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(from, "ZakSim"); // 보내는 사람(생략하면 정상작동 안 함.)
				messageHelper.setTo(email); // 받는 사람
				messageHelper.setSubject(title); // 제목 (생략 가능)
				messageHelper.setText(content); // 내용
				
				mailSender.send(message); // 메일 보내기
				
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			map.put("ranPw", ranPw);
			memberDao.findPwResult(map); // DB에 임시 비밀번호 저장
		}
		return ranPw;
	}

	@Override
	public void join(ZakSimMember memberDto) {
		memberDao.join(memberDto);
	}

	@Override
	public boolean checkId(String id) {
		if (memberDao.checkId(id) == 0) {
			// 사용 가능한 ID일 경우
			return true;
		} else {
			// 중복된 ID 발견
			return false;
		}
	}

	@Override
	public boolean checkNick(String nick) {
		if (memberDao.checkNick(nick) == 0) {
			// 사용 가능한 닉네임일 경우
			return true;
		} else {
			// 중복된 닉네임 발견
			return false;
		}
	}

	@Override
	public String authEmail(String email) {
		String title = "[ZakSim] 이메일 인증번호입니다."; // 이메일 제목
		
		String ranNum = UUID.randomUUID().toString().replaceAll("-", ""); // - 제거
		ranNum = ranNum.substring(0, 10);
		String content = "인증번호는 [ " + ranNum + " ] 입니다."; // 이메일 내용
		
		// 이메일 보내기 설정
		try {
			message = mailSender.createMimeMessage();
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(from, "ZakSim"); // 보내는 사람(생략하면 정상작동 안 함.)
			messageHelper.setTo(email); // 받는 사람
			messageHelper.setSubject(title); // 제목 (생략 가능)
			messageHelper.setText(content); // 내용
			
			mailSender.send(message); // 메일 보내기
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		System.out.println("생성된 인증번호 : " + ranNum);
		return ranNum;
	}

}
