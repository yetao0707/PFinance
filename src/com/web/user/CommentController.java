package com.web.user;

import com.DTO.CustomerCommentDTO;
import com.DTO.CustomerDTO;
import com.dao.CustomerCommentDAO;
import com.google.gson.Gson;
import com.util.DwzAjaxUtil;
import com.util.ParseBeanUtil;
import com.util.bean.DwzAjaxBean;
import com.vo.fp.CustomerCommentVO;
import com.web.admin.CustomerCommentController;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by yetao on 17/4/29.
 */

@Controller
@RequestMapping("user")
public class CommentController extends BaseController {

    private Logger logger = Logger.getLogger(CommentController.class);

    @Autowired
    private CustomerCommentDAO customerCommentDAO;

    @RequestMapping("commentIndex")
    public String index(HttpServletRequest request) {
        return "user/comment/commentIndex";
    }

    @RequestMapping("saveComment")
    @ResponseBody
    public void save(CustomerCommentDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
        DwzAjaxBean dwzAjaxBea = new DwzAjaxBean();
        CustomerCommentVO vo = ParseBeanUtil.parseCustomerCommentDTO2VO(dto);
        vo.setCustomerId(getCustomerId(request));
        try {
            customerCommentDAO.insert(vo);
            dwzAjaxBea = DwzAjaxUtil.constructAddSuccessBean();
        } catch (Exception e) {
            logger.error("CustomerCommentController del faild CustomerCommentDTO=" + dto, e);
            dwzAjaxBea = DwzAjaxUtil.constructEditFailBean();
        }
        writeObject(dwzAjaxBea, response);
    }

    @RequestMapping("myComments")
    public String getMyComments(HttpServletRequest request) {
        CustomerCommentVO customerCommentVO = new CustomerCommentVO();
        customerCommentVO.setCustomerId(getCustomerId(request));
        List<CustomerCommentVO> customerCommentVOs = customerCommentDAO.findList(customerCommentVO);
        List<CustomerCommentDTO> customerCommentDTOs = ParseBeanUtil.parseCustomerCommentVO2DTO(customerCommentVOs);
        request.setAttribute("customerCommentDTOs", customerCommentDTOs);
        return "user/comment/myBox";
    }
}
