package com.petcab.work.dog.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.dog.model.dao.DogDao;
import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;


@Service
public class DogServiceImpl implements DogService {
	@Autowired
	private DogDao dogDao;
	
	@Override
	@Transactional
	public int saveDog(Dog dog) {
		
		int result =0;
		
		result=dogDao.insertDog(dog);
		
		return result;
	}


//	@Override
//	@Transactional
//	public int saveDog(Dog dog, Member member) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
}
