package com.exam;

public class ScoreBean {
	private String name;
	private int kor;
	private int math;
	private int eng;
	
	//getter, setter	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	
	//합계 구하기  --> sjp에서도 만들 수 있지만 view를 담당하는 부분에는 보여지는 부분만 들어가도록
	public int getTotal() {
		return kor+eng+math;
	}
	//총점 구하기
	public int getAvg() {
		return (kor+eng+math)/3;
	}
	//학점
	public String getGrade() {
		String grade = "";
		switch(((kor+eng+math)/3)/10) {
		case 10:
		case 9: grade = "A"; break;
		case 8: grade = "B"; break;
		case 7: grade = "C"; break;
		default:  grade = "F";
		}
		return grade;
	}
}
