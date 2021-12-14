package com.sample.jsblog.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.jsblog.dao.UserDao;
import com.sample.jsblog.exception.LoginException;
import com.sample.jsblog.exception.UserRegisterException;
import com.sample.jsblog.utils.SessionUtils;
import com.sample.jsblog.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired UserDao userDao;
	
	@Override
	public void insertUser(User user) {
	
		User savedUser = userDao.getUserId(user.getUserId());
		if(savedUser != null) {
			throw new UserRegisterException("아이디중복", "["+user.getUserId()+"]는 이미 사용중입니다.");
		}
		savedUser = userDao.getUserEmail(user.getUserEmail());
		if(savedUser != null) {
			throw new UserRegisterException("이메일중복", "["+user.getUserEmail()+"[는 이미 사용중인 이메일입니다.");
		}
		String secretPassword = DigestUtils.sha256Hex(user.getUserPassword());
		user.setUserPassword(secretPassword);
		
		userDao.insertUser(user);
		
	}
	@Override
	public void login(String userId, String userPassword) {
		User user = userDao.getUserId(userId);
		if(user == null) {
			throw new LoginException("아이디/비밀번호 오류", "아이디가 없거나 일치하지 않습니다.");	
		}
		String secretPassWord = DigestUtils.sha256Hex(userPassword);
		if(!user.getUserPassword().equals(secretPassWord)) {
			throw new LoginException("아이디/비밀번호 오류", "비밀번호가 일치하지 않습니다");
		}
		// Httpsession객체에 사용자인증이 완료된 사용자정보를 속성으로 추가
		SessionUtils.addAttribute("LOGINED_USER", user);
	}
	
	@Override
	public User getUserById(String userId) {
		return userDao.getUserId(userId);
		
	}
	
	@Override
	public User changeinfogetUserpassowrd(User user) {
		String password = user.getUserPassword();
		String passwords = DigestUtils.sha256Hex(password);
		User users = new User();
		users.setUserPassword(passwords);
		userDao.changeinfogetUserpassowrd(users);
		return user;
	}
	
	@Override
	public void updateUserInfo(User user) {
		String secretpassword = DigestUtils.sha256Hex(user.getUserPassword());
		user.setUserPassword(secretpassword);
		userDao.updateUserInfo(user);
		
		
	}
	
	@Override
	public void deleteuser(String user) {
		userDao.deleteuser(user);		
	}

	@Override
	public int idCheck(String userId) throws Exception {
			
		return userDao.idCheck(userId);
	}
	@Override
	public List<User> usersList() {
		
		return userDao.usersList();
	}
}
