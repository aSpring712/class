package com.member.dao;

import java.util.ArrayList;

import com.member.dto.MemberDTO;

public interface MemberDAO {
	// 추가
	public void memInsert(MemberDTO member); // 인터페이스는 중괄호 놉
	
	// 전체보기
	public ArrayList<MemberDTO> memList();
	
	// 수정
	public int memUpdate(MemberDTO member);
	
	// 삭제
	public void memDelete(String userid);
	
	// 상세보기
	public MemberDTO findById(String userid);
	
	// 아이디 중복 체크
	public String idCheck(String userid);
	
	// 로그인 체크
	public int loginCheck(String userid, String pwd);
	
	// 회원 수
	public int getCount();
}
