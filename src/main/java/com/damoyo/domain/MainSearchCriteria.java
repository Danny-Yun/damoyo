package com.damoyo.domain;

import lombok.Data;

@Data
public class MainSearchCriteria extends MainCriteria {
	private String searchType;
	private String keyword;
}
