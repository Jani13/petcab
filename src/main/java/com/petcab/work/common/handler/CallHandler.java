package com.petcab.work.common.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class CallHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(CallHandler.class);

	/*@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// TODO Auto-generated method stub
		super.handleBinaryMessage(session, message);
	}*/
	
	@Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	logger.info(message.toString());
    	    	
    }
}
