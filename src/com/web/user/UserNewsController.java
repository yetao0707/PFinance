package com.web.user;

import com.DTO.NewsDTO;
import com.dao.NewsDAO;
import com.util.ParseBeanUtil;
import com.vo.fp.NewsVO;
import com.web.admin.NewsController;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserNewsController {
    private Logger logger = Logger.getLogger(UserNewsController.class);

    @Autowired
    private NewsDAO newsDAO;

    @RequestMapping("newsIndex")
    public String newsIndex(HttpServletRequest request) {
        List<NewsVO> list = newsDAO.findList(new NewsVO());
        List<NewsDTO> dtos = ParseBeanUtil.parseNewsVO2DTO(list);
        request.setAttribute("newsDTOS",dtos);
        return "user/news/news";
    }

    @RequestMapping("newsDetail")
    public String newsDetail(HttpServletRequest request,NewsVO newsVO) {
        newsVO = newsDAO.find(newsVO);
        NewsDTO newsDTO = ParseBeanUtil.parseNewsVO2DTO(newsVO);
        request.setAttribute("newsDTO", newsDTO);
        return "user/news/newsDetail";
    }
}
