package controller;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
