package com.petcab.work.dog.model.service;

import java.util.List;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;

public interface DogService {

   int saveDog(Dog dog);

   List<Dog> searchUserId(String userId);

//   int getdogCount();
   
   Dog searchByDogNo(int dogNo);
   
   int updateDog(Dog dog);
   
   List<Dog> searchByCallNo(int callNo);

   int deleteDog(int dogNo);
}

