package com.petcab.work.dog.model.service;

import java.util.List;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;

public interface DogService {

	int saveDog(Dog dog);

//	int saveDog(Dog dog, Member member);

	List<Dog> searchUserId(String userId);

//	int getdogCount();
	
	Dog searchByDogNo(int dogNo);
	
	List<Dog> searchByCallNo(int callNo);
}
