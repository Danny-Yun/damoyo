package com.damoyo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MainCriteria {
	
	private int pageNum;
	private int amount;
	
	public MainCriteria() {
		this(1, 10);
	}

	public MainCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
