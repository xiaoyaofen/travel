package com.yaofen.controller;

import com.google.gson.Gson;
import com.yaofen.bean.Document;
import com.yaofen.bean.LayuiData;
import com.yaofen.bean.Params;
import com.yaofen.bean.User;
import com.yaofen.servicelog.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/document")
public class DocumentController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/getDocMsg", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getDocMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        String time1 = request.getParameter("key[start]");
        String time2 = request.getParameter("key[end]");
        String people = request.getParameter("key[worker]");
        String title = request.getParameter("key[title]");
        String type = request.getParameter("key[type]");

        page1 = (page1 - 1) * limit;
        List<Document> list = loginService.findDoc(time1, time2, people, title, type, page1, limit);
        Integer count = loginService.findCountDoc(time1, time2, people, title, type);

        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(count);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/getSearchDoc", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getSearchDoc(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String doc = request.getParameter("key[doc]");
        List<Document> list = loginService.getDoc(doc);
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(10);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/getValue", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getValue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        Integer limit = Integer.parseInt(request.getParameter("limit"));
        Integer page1 = Integer.parseInt(page);
        page1 = (page1 - 1) * limit;
        List<Params> list = loginService.getValue(page1, limit);
        Integer num = loginService.findCountValue();
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(num);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/fixValue", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object fixValue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String document = request.getParameter("document");
        String point = request.getParameter("point");
        String id = request.getParameter("hideid");
        Integer num = loginService.fixValue(id, document, point);
        if (num != 0) {
            return "修改成功";
        } else {
            return "修改失败，请重试";
        }
    }

    @RequestMapping(value = "/delValue", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object delValue(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Integer num = loginService.delValue(id);
        if (num != 0) {
            return "删除成功";
        } else {
            return "删除失败，请重试";
        }
    }

    @RequestMapping(value = "/upload")
    @ResponseBody
    public Object upload(HttpServletRequest request, HttpServletResponse response,
                         MultipartFile file) {
        String title = request.getParameter("title");
        String score = request.getParameter("score");
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            Date date = new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid = UUID.randomUUID() + "";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = simpleDateFormat.format(date);

            //"/upload/"最后的的斜杠会被tomcat取消掉，需要把/放在projectPath
            String savePath = request.getSession().getServletContext().getRealPath("/upload");
            //要保存的问题件路径和名称   /upload/2020-09-09/uuid.jpg
            String projectPath = savePath + File.separator + dateStr + File.separator + uuid + "." + prefix;
            System.out.println("projectPath==" + projectPath);
            File files = new File(projectPath);
            //打印查看上传路径
            if (!files.getParentFile().exists()) {//判断目录是否存在
                System.out.println("files11111=" + files.getPath());
                files.getParentFile().mkdirs();
            }
            file.transferTo(files); // 将接收的文件保存到指定文件中
            System.out.println(projectPath);
            LayuiData layuiData = new LayuiData();
            layuiData.setCode(0);
            layuiData.setMsg("上传成功");
            User user = (User) request.getSession().getAttribute("user");
            Document document = new Document();
            document.setTitle(title);
            document.setRecord(score);
            document.setType(prefix);
            document.setWorker(String.valueOf(user.getId()));
            document.setUrl("\\upload" + File.separator + dateStr + File.separator + uuid + "." + prefix);
            Integer num = loginService.addDocuemnt(document);
            return layuiData;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/getDownloadDoc", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object getDownloadDoc(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Document> list = loginService.getDownloadDoc();
        LayuiData layuiData = new LayuiData();
        layuiData.setMsg("");
        layuiData.setCode(0);
        layuiData.setCount(10);
        layuiData.setData(list);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/download", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public Object download(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String record = request.getParameter("record");
        String point = loginService.findPoint(name);
        if (Integer.parseInt(point) >= Integer.parseInt(record)) {
            String url = loginService.findUrlById(id);
            return url;
        } else {
            return "积分不足";
        }
    }

}
