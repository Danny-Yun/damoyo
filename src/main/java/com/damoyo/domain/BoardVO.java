package com.damoyo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long b_num;
	private String b_cate_name;
	private String b_title;
	private String b_content;
	private Date b_date;
	private Long b_like;
	private String b_image1;
	private String b_image2;
	private String b_image3;
	private Long b_view;
	private Long m_num;
	private String u_id;
}
