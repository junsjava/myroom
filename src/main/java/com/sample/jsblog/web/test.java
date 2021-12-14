package com.sample.jsblog.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import org.springframework.stereotype.Controller;


@Controller
public class test {
	public static void main(String[] args) {
		
		HashMap<String, Object> a = new HashMap<String, Object>();
		List<String> ab = new ArrayList<String>();
		
		String abc = "123";
		int adc = 123;
		ab.add("1");
		ab.add("2");
		ab.add("똥");
		Scanner s = new Scanner(System.in);
		System.out.println("이름 입력");
		s.next();
		
		
		
		a.put("name",ab);
		a.put("age" , 5);
		a.put("adrees", "서울시 노원구 공릉도 청우시티아파트 403호");

		
		System.out.println(a.get("name"));
		System.out.println("나이"+ a.get("age"));
		System.out.println("주소 :" +  a.get("adrees"));
		
		
		a.put("over", "워치");
		a.put("객체", ab);
		
		System.out.println("객체 출력"+ a.get("객체"));
		
		System.out.println(abc);
		System.out.println(adc);
	}
}
