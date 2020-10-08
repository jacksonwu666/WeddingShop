package com.huabei.weddingshop.vo;

//主页面数据显示的VO类
public class HomeVO {
	//订单数
	private Integer num;
	//月份
	private String month;

	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}

	public HomeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HomeVO(Integer num, String month) {
		super();
		this.num = num;
		this.month = month;
	}

	@Override
	public String toString() {
		return "HomeVO [num=" + num + ", month=" + month + "]";
	}
}
