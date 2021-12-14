package com.sample.jsblog.web;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sample.jsblog.service.BoardService;
import com.sample.jsblog.vo.Board;

@Controller
public class MainController {

	@Autowired BoardService boardService;
	
	
	@GetMapping("/")
	public String main(Model model) {
		List<Board> board = boardService.getBoardList();
		model.addAttribute("list",board);
	
		return "main";
	}
	
	@GetMapping("gong")
	public String Gongji(){
		
		return "gongji";
	}
}
