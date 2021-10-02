package com.damoyo.mapper;

import java.util.List;

import com.damoyo.domain.PlanVO;

public interface PlanMapper {
	
	public void insertPlan (PlanVO vo);
	
	public List<PlanVO> getPlans (Long m_num);
}
