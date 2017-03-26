package com.DTO;

import com.vo.BaseVO;

import java.util.Date;


public class CustomerCommentDTO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long customerId;
    private String commentText;
    private String addTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddtime(String addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "CustomercommentVO [id=" + id + ", customerId=" + customerId + ", commentText=" + commentText + ", addtime=" + addTime
                + "]";
    }


}
