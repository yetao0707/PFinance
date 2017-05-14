package com.DTO;

import com.vo.BaseVO;

import java.util.Date;
import java.util.List;


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
    private String tag;
    private String replyText;
    private String replyBy;
    private List<String> tagList;



    private String title;

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

    public List<String> getTagList() {
        return tagList;
    }

    public void setTagList(List<String> tagList) {
        this.tagList = tagList;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
