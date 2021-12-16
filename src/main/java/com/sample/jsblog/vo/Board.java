package com.sample.jsblog.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {
	private String boardNo;
	private String boardTitle;
	private String boardArea;
	private String userId;
	private Integer viewCount;
	private Date createDate;
	private String subBoard;
	private String no;
	
	public Integer getViewCount() {
		return viewCount;
	}
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
}
