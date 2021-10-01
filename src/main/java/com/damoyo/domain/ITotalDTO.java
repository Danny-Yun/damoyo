package com.damoyo.domain;

import java.util.List;

import lombok.Data;

@Data
public class ITotalDTO {
	public String i_cate_name;
	public List<IDetailVO> detailList;
}
