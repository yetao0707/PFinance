package com.DTO;

import com.vo.BaseVO;

import java.util.Date;


public class NewsDTO extends BaseVO {

    // Fields

    /**
     *
     */
    private static final long serialVersionUID = 1L;


    private Long id;
    private String content;

    private String title;

    private String img;

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

    private String addTime;

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

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addtime) {
        this.addTime = addtime;
    }

    @Override
    public String toString() {
        return "NewsVO [id=" + id + ", content=" + content + ", addtime=" + addTime + "]";
    }


}
