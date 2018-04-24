package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.util.UtilFactory;

@Controller
@RequestMapping(value = "/test/")
public class TestCtl {

    @RequestMapping(value = "buildTables")
    public String buildTAbles(Model model, HttpSession session) {

        Session fty = UtilFactory.getSession();
        org.hibernate.Transaction tx = fty.beginTransaction();
        tx.commit();
        fty.close();
        return "redirect:../index.jsp";
    }

    @RequestMapping(value = "test")
    public String test(Model model, HttpSession session) {
        System.out.println("hello world!");
        return "../user/userInfo.jsp";
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String upload(Model model, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        // 第一种返回页面的方法
        // model.addAttribute("img",PhotoUtil.saveFile(file,request));
        // 第二种返回页面的方法
        request.setAttribute("img", PhotoUtil.saveFile(file, request));
        return "../admin/test.jsp";
    }

}
