package com.petcab.work.dog.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;



@Mapper
public interface DogDao {
	int insertDog(Dog dog);
//	int updateDog(Dog dog);
//	int deleteDog(Dog dog);
<<<<<<< HEAD

	List<Dog> searchUserNo(@Param("userNo") int userNo);

=======
>>>>>>> parent of d4e329e (0405_관리자마이페이지작업중)
}
