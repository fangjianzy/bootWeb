package com.jimmy.framework.core.common.entity;

public class Response {
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	private String responseMessage;

	public Response(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public String getResponseMessage() {
		return responseMessage;
	}
}
