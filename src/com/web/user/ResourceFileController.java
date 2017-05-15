package com.web.user;

import com.DTO.NewsDTO;
import com.dao.NewsDAO;
import com.mathworks.toolbox.javabuilder.external.org.json.JSONObject;
import com.util.CommonUtil;
import com.util.ParseBeanUtil;
import com.vo.fp.NewsVO;
import org.apache.commons.lang.StringUtils;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("user")
public class ResourceFileController {

    @Autowired
    private NewsDAO newsDAO;


//    @RequestMapping(value="/save",method= RequestMethod.POST)
//    public JSONObject save(String base64, String type, Long size, String filename) throws IOException {
//
//        String[] temp1= base64.split(",");
//        base64 = temp1[1];
//        String[] temp2 = base64.split("\"");
//        base64 = temp2[0];
//
//        ResourceFile resourceFile = new ResourceFile();
//        resourceFile.setBytes(CommonUtil.Base64ToBytes(base64));
//        resourceFile.setType(type);
//        resourceFile.setSize(size);
//        resourceFile.setFilename(filename);
//        resourceFile.setUploadDate(new Date());
//
//        resourceFile = iResourceFileSerive.save(resourceFile);
//
//        if (resourceFile.get_id() != null) {
//            return new JsonWrapper.Builder("resouceFile", resourceFile).build();
//        } else {
//            return new JsonWrapper.Builder(false).build();
//        }
//    }

    @RequestMapping(value="/img",method= RequestMethod.GET)
    public void query(HttpServletResponse response, NewsDTO newsDTO) throws IOException {
        NewsVO newsVO = ParseBeanUtil.parseNewsDTO2VO(newsDTO);
        newsVO = newsDAO.find(newsVO);
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/octet-stream;charset=UTF-8");

        String base64=newsVO.getImg();
        if (StringUtils.isEmpty(base64)) {
            return;
        }
        String[] temp1= base64.split(",");
        base64 = temp1[1];
        String[] temp2 = base64.split("\"");
        base64 = temp2[0];
        byte[] bytes = CommonUtil.Base64ToBytes(base64);

        if (bytes == null) {
            return;
        }

        response.addHeader("Content-Disposition", "attachment;filename=" );

        InputStream is = new ByteArrayInputStream(bytes);

        OutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            bos.flush();
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
    }
}
