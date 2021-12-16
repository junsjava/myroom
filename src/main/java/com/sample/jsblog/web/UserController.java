package com.sample.jsblog.web;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sample.jsblog.form.UserRegisterForm;
import com.sample.jsblog.service.BoardService;
import com.sample.jsblog.service.UserService;
import com.sample.jsblog.utils.SessionUtils;
import com.sample.jsblog.view.JsonView;
import com.sample.jsblog.vo.Board;
import com.sample.jsblog.vo.User;


@Controller
public class UserController {
	
	@Autowired UserService userService;
	
	@Autowired BoardService boardService;
	
	@Autowired JsonView jsonView;
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/register")
	public String register() {
		
	
		return "register/registerform";
	}
	
	@RequestMapping(value={"/registerform", "/registers"})
	public String registerform(UserRegisterForm userRegisterForm, @RequestParam("postnum")String postnum, @RequestParam("adress")String adress,@RequestParam("infoadress")String infoadress) {
		User user = new User();
		String userAdress=postnum+adress+infoadress;
		userRegisterForm.setUserAdress(userAdress);
		BeanUtils.copyProperties(userRegisterForm, user);
		
		userService.insertUser(user);
		
		return "redirect:login";
	}
	
	@PostMapping("loginform")
	public String loginform(@RequestParam("userId")String userId, @RequestParam("userPassword")String userPassword, Model model) {
		
		List<Board> list =  boardService.getBoardList();
		model.addAttribute("list",list);
		
		userService.login(userId, userPassword);
		
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout() {
		SessionUtils.destroySession();
		return "redirect:/";
	}
	

	@GetMapping("/board/json")
	public ModelAndView detailJson(@RequestParam("userId")String userId) {
		User user = userService.getUserById(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data",user);
		mav.setView(jsonView);
		
		return mav;
	}
	
	@GetMapping("mypage")
	public String mypage(@RequestParam("userId")String userId,Model model) {
		User users = userService.getUserById(userId);
		System.out.println("="+userId);
		model.addAttribute("user",users);
		System.out.println("="+users);
				
		return "mypage";
	}
	@GetMapping("changeinfo")
	public String changeinfo() {
		
		return "changeinfo";
	}
	@PostMapping("infojoin")
	public String infojoin(@RequestParam("userId")String userId,@RequestParam("password")String password,Model model) {
		User user = new User();
		user.setUserId(userId);
		user.setUserPassword(password);
		
		User userinfo =userService.getUserById(userId);
		
		userService.changeinfogetUserpassowrd(user);
		model.addAttribute("user",user);
		model.addAttribute("userinfo",userinfo);
		return "mypagemodify";
	}
	
	@PostMapping("updateinfo")
	public String updateinfo(@RequestParam("userIds")String userId,@RequestParam("password")String userpassword,
							 @RequestParam("userEmail")String userEmail,@RequestParam("userAdress")String userAdress) {
		User user = new User();
		user.setUserId(userId);
		user.setUserPassword(userpassword);
		user.setUserEmail(userEmail);
		user.setUserAdress(userAdress);
		System.out.println("가가"+userId);
		userService.updateUserInfo(user);
		return "redirect:/";
	}
	@GetMapping("deleteuser")
	public String deleteuser(@RequestParam("userId")String userId) {
		userService.deleteuser(userId);
		SessionUtils.destroySession();
		return "redirect:/";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value="/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userId) throws Exception{
		int result = userService.idCheck(userId);
		
		if(result != 0) {
			return "fail";
			
		}else {
			return "success";
		}
	} // memberIdChkPOST() 종료	
	
	@RequestMapping(value ="/userList",method= RequestMethod.GET)
	public String UserList() {
		//작업필요  << 유저리스트 json 형태로 받아서 Userlist페이지로 이동 및 전달 해봐야함
		return null;
	}
	@RequestMapping("jsonuserlist")
	public ModelAndView usersList() {
		
		List<User> list = userService.usersList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setView(jsonView);
		
		return mav;
	}
	@GetMapping("userListss")
	public String userpages() {
		return "comunity/UserList";
	}
	
	@RequestMapping(value="/searchs")
	public ModelAndView searchuser(@RequestParam("userId")String userId) {
			User list = userService.getUserById(userId);
			System.out.println(list);
			ModelAndView mav = new ModelAndView();
			mav.addObject("data",list);
			mav.setView(jsonView);
		return mav;
	}
	
}
