package com.damoyo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PlanVO {
	private int m_plan_num;
	private String m_plan_name;
	private int m_plan_people_cnt;
	private Date m_plan_startdate;
	private String m_plan_money;
	private String m_plan_area;
	private Long m_num;
}
