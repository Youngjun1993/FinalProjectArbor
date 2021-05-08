package com.arbor.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CartService implements CartServiceImp{
	@Inject
	CartServiceImp cartdao;
}
