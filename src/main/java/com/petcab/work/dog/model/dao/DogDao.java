package com.petcab.work.dog.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.user.model.vo.Dog;

@Mapper
public interface DogDao {
   int insertDog(Dog dog);

   List<Dog> searchUserId(String userId);

   Dog searchByDogNo(int dogNo);

   int updateDog(Dog dog);

   List<Dog> searchByCallNo(int callNo);

   int deleteDog(int dogNo);

}

