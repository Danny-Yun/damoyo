package com.damoyo.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private Long b_comment_num;
	private String b_comment_content;
	private Long m_num;
	private Long b_num;
	private String u_id;
}
