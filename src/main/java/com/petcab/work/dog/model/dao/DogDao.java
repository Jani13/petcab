package com.petcab.work.dog.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.user.model.vo.Dog;



@Mapper
public interface DogDao {
	int insertDog(Dog dog);
//	int updateDog(Dog dog);
//	int deleteDog(Dog dog);
}
