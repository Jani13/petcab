package com.petcab.work.dog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.dog.model.dao.DogDao;
import com.petcab.work.user.model.vo.Dog;


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

	@Override
	public List<Dog> searchUserId(String userId) {
		
		return dogDao.searchUserId(userId);
	}

	@Override
	public Dog searchByDogNo(int dogNo) {
		
		return dogDao.searchByDogNo(dogNo);
	}

	@Override
	public int updateDog(Dog dog) {
		int result =0;
		
		result=dogDao.updateDog(dog);
		
		return result;
	}

	@Override
	public List<Dog> searchByCallNo(int callNo) {
				
		return dogDao.searchByCallNo(callNo);
	}

   @Override
   public int deleteDog(int dogNo) {
      
      return dogDao.deleteDog(dogNo);
   }
   
}
