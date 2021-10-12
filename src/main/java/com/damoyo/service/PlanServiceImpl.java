package com.damoyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoyo.domain.PlanVO;
import com.damoyo.mapper.PlanMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanMapper mapper;
	
	@Override
	public void insertPlan(PlanVO vo) {
		mapper.insertPlan(vo);
	}
	
	@Override
	public List<PlanVO> getPlans(Long m_num) {
		return mapper.getPlans(m_num);
	}

}
