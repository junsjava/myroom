package com.sample.jsblog.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserRegisterForm {

	private String userId;
	private String userName;
	private String userPassword;
	private String userPasswordcheck;
	private String userPhone;
	private String userEmail; 
	private String userAdress;
	private String gender;
}
