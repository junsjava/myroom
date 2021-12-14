package com.sample.jsblog.dao;


import java.util.List;

import com.sample.jsblog.vo.User;
public interface UserDao {

	/**
	 * 회원가입시 사용자 정보를 저장
	 * @param user 신규 사용자 정보
	 */
	void insertUser(User user);
	
	/**
	 * 사용자 아이디를 가져온다
	 * @param userId 사용자 아이디
	 * @return
	 */
	User getUserId (String userId);
	
	/**
	 * 사용자 이메일을 가져온다
	 * @param userEmail 사용자 이메일 아이디
	 * @return
	 */
	User getUserEmail(String userEmail);
	
	User changeinfogetUserpassowrd(User user);
	
	void updateUserInfo(User user);
	
	void deleteuser(String userId);
	
	public int idCheck(String userId);
	
	List<User> usersList();
}
