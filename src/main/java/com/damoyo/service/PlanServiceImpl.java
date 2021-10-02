package com.damoyo.service;

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

}
