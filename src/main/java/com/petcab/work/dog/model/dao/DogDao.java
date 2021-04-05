package com.petcab.work.dog.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;



@Mapper
public interface DogDao {
	int insertDog(Dog dog);

//	int updatedog(Dog dog);


}
