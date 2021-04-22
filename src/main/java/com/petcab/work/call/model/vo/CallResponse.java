package com.petcab.work.call.model.vo;

public class CallResponse {

    private ResponseResult responseResult;
    private String chatRoomId;
    private String sessionId;

    public CallResponse() {
    }

    public CallResponse(ResponseResult responseResult, String chatRoomId, String sessionId) {
        this.responseResult = responseResult;
        this.chatRoomId = chatRoomId;
        this.sessionId = sessionId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getChatRoomId() {
        return chatRoomId;
    }

    public void setChatRoomId(String chatRoomId) {
        this.chatRoomId = chatRoomId;
    }

    public ResponseResult getResponseResult() {
        return responseResult;
    }

    public void setResponseResult(ResponseResult responseResult) {
        this.responseResult = responseResult;
    }

    @Override
    public String toString() {
        return "ChatResponse{" + "responseResult=" + responseResult + ", chatRoomId='" + chatRoomId + '\'' + ", sessionId='" + sessionId + '\'' + '}';
    }

    public enum ResponseResult { // 수정 필요
        SUCCESS, CANCEL, TIMEOUT;
    }
}

