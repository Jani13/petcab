package com.petcab.work.dog.model.service;

import java.util.List;

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
	public int saveDog(Dog dog ) {
		int result = 0;

		result = dogDao.insertDog(dog);

		return result;
	}

<<<<<<< HEAD
	@Override
	public List<Dog> searchUserNo(int userNo) {
		// TODO Auto-generated method stub
		return dogDao.searchUserNo(userNo);
	}

=======
>>>>>>> parent of d4e329e (0405_관리자마이페이지작업중)
//	@Override
//	@Transactional
////	public int saveDog(Dog dog) {
//		public int saveDog(Dog dog,Member member) {
//		int result = 0;
//		
//		result = dogDao.insertDog(dog,member);
//		
//		return result;
//	}
}
