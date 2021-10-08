package com.damoyo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPageDTO {
	private int total;
	private int startPage;
	private int endPage;
	private int btnNum;
	private boolean prev, next;
	private BoardCriteria cri;
	
	public BoardPageDTO(int total, BoardCriteria cri) {
		this.total = total;
		this.cri = cri;
		this.btnNum = 10;
		
		this.endPage = (int) Math.ceil((this.cri.getPageNum() / (double) this.btnNum)) * this.btnNum;
		this.startPage = this.endPage - this.btnNum + 1;
		
		int realEnd = (int) Math.ceil((double)this.total / this.cri.getAmount());
		if(realEnd < endPage)
			endPage = realEnd;
		
		this.prev = this.startPage == 1 ? false : true;
		this.next = this.endPage < realEnd;
		
	}
	
}
