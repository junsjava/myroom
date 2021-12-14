package com.sample.jsblog.service;


import java.util.List;

import com.sample.jsblog.vo.User;


public interface UserService {

	/**
	 *	지정된 사용자 정보로 회원가입 수행 
	 * @param user 신규회원
	 */
	void insertUser(User user);
	
	void login(String userId, String userPassword);
	
	User getUserById(String userId);
	
	User changeinfogetUserpassowrd(User user);
	
	void updateUserInfo(User user);
	
	void deleteuser(String user);
	
	public int idCheck(String userId) throws Exception;
	
	List<User> usersList();
}
	
