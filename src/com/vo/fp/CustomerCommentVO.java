package com.vo.fp;

import java.util.Date;
import java.util.List;

import com.vo.BaseVO;


public class CustomerCommentVO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private Long customerId;
    private String commentText;
    private String title;
    private String tag;
    private String replyText;
    private String replyBy;
    private Date addTime;

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getReplyText() {
        return replyText;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }

    public String getReplyBy() {
        return replyBy;
    }

    public void setReplyBy(String replyBy) {
        this.replyBy = replyBy;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

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

    public Date getAddTime() {
        return addTime;
    }

    public void setAddtime(Date addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "CustomercommentVO [id=" + id + ", customerId=" + customerId + ", commentText=" + commentText + ", addtime=" + addTime
                + "]";
    }


}
