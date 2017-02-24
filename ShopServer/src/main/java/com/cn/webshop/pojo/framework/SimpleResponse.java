package com.cn.webshop.pojo.framework;

public class SimpleResponse {
	private boolean state;
	private Object data;
	private String message;
	
	public SimpleResponse(){}
	
	public SimpleResponse(boolean state, Object data){
		this.state = state;
		this.data = data;
	}
	
	public SimpleResponse(boolean state, Object data, String message){
		this.state = state;
		this.data = data;
		this.message = message;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	public static SimpleResponse markSuccess(){
		return new SimpleResponse(true, null);
	}
	
	public static SimpleResponse markSuccess(Object data){
		return new SimpleResponse(true, data);
	}
	
	public static SimpleResponse markError(){
		return new SimpleResponse(false, null);
	}
	
	public static SimpleResponse markError(String msg){
		return new SimpleResponse(false, null, msg);
	}

}
