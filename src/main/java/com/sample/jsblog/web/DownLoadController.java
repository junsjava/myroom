package com.sample.jsblog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DownLoadController {

	@GetMapping("downloadpage")
	public String downloadpage() {
		return "downloadpage/downloadmain";
	}
}
