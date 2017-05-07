package com.util.bean;

import java.io.Serializable;

/**
 * Created by yetao on 17/5/2.
 */
public class ResponseBO implements Serializable {
    private static final long serialVersionUID = 119480119129831664L;
    private int code;

    private String errMsg;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }

    @Override
    public String toString() {
        return "ResponseBOUtil{" +
                "code=" + code +
                ", errMsg='" + errMsg + '\'' +
                '}';
    }
}
