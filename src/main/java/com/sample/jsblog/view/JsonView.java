package com.sample.jsblog.view;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Component
public class JsonView extends AbstractView{
	
	Gson gson = new Gson();
	public JsonView() {
		GsonBuilder builder = new GsonBuilder();
		builder.setDateFormat("yyyy-mm-dd");
		gson = builder.create();
	}
	
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		   
		Object data = model.get("data");
		String jsonText = gson.toJson(data);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(jsonText);
		out.flush();
		out.close();
	}
}
