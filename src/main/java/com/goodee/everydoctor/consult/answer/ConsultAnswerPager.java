package com.goodee.everydoctor.consult.answer;

import lombok.Data;

@Data
public class ConsultAnswerPager {

	private Long page;
	private Long startRow;
	private Long perPage;
	private Long totalPage;
	
	private Long consultNum;
	
	public ConsultAnswerPager() {
		this.perPage=5L;
	}

	//1. mapper에서 사용할 값 계산
	public void getRowNum()throws Exception {
		this.startRow = (this.getPage()-1)*this.getPerPage();
	}

	//2. Jsp에서 사용할 값 계산
	public void getNum(Long totalCount)throws Exception {
		//2. totalCount로 totalPage구하기
		this.totalPage = totalCount / this.getPerPage();
		if(totalCount % this.getPerPage() != 0) {
			totalPage++;
		}

		//2.1 totalPage보다 page가 더 클 경우
		if(this.getPage()>totalPage) {
			this.setPage(totalPage);
		}
		
	}
	
	public Long getPage() {
		if(this.page==null || this.page<1) {
			this.page=1L;
		}

		return page;
	}

	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=5L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
}
