package com.petcab.work.dog.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;

@Mapper
public interface DogDao {
	int insertDog(Dog dog);

//	int updateDog(Dog dog);

	List<Dog> searchUserId(String userId);

	Dog searchByDogNo(int dogNo);

}
