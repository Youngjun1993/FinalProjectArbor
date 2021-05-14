package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.arbor.home.dao.FaqDAOImp;

@Service
public class FaqService implements FaqServiceImp {

	@Inject
	FaqDAOImp FaqDAO;

}
