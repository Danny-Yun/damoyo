package com.damoyo.service;

import java.util.List;

import com.damoyo.domain.PlanVO;

public interface PlanService {
	
	public void insertPlan(PlanVO vo);
	
	public List<PlanVO> getPlans(Long m_num);
}
