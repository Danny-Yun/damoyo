package com.damoyo.domain;

import lombok.Data;

@Data
public class BoardSearchCriteria extends BoardCriteria {
	private String searchType;
	private String keyword;
}
