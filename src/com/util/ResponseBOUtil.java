package com.util;

import com.util.bean.ResponseBO;

import java.io.Serializable;


public class ResponseBOUtil implements Serializable{
    private static final long serialVersionUID = 7183458436024970889L;
    public static final int SUCCESS=100;
    public static final int ERROR=200;

    public static ResponseBO buildLoginSuccess(){
        ResponseBO responseBO=new ResponseBO();
        responseBO.setCode(SUCCESS);
        return responseBO;
    }

    public static ResponseBO buildLoginError(String msg){
        ResponseBO responseBO=new ResponseBO();
        responseBO.setCode(ERROR);
        responseBO.setErrMsg(msg);
        return responseBO;
    }

    public static ResponseBO buildResponseBO(int code,String msg){
        ResponseBO responseBO=new ResponseBO();
        responseBO.setCode(code);
        responseBO.setErrMsg(msg);
        return responseBO;
    }
}
