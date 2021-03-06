package com.vo.fp;

import java.util.Date;
import java.util.List;

import com.vo.BaseVO;


public class NewsVO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private String content;

    private String img;
    private Date addTime;

    private String title;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addtime) {
        this.addTime = addtime;
    }

    @Override
    public String toString() {
        return "NewsVO [id=" + id + ", content=" + content + ", addtime=" + addTime + "]";
    }


}
