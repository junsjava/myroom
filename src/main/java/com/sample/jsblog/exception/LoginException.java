package com.sample.jsblog.exception;

public class LoginException extends SampleException {
	
	private static final long serialVersionUID = -4201501071988186261L;

	public LoginException(String title, String message) {
		super(title,message);
	}
}
