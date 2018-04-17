package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.OrderDao;
import dao.UserInfoDao;
import dao.tables.OrderDetail;
import dao.tables.OrderForm;
import dao.tables.UserInfo;

@Controller
@RequestMapping(value = "/user/")
public class UserCtl {
    @Autowired
    private UserInfoDao userDao;
    @Autowired
    private OrderDao orderDao;

    @RequestMapping(value = "register")
    public String register(Model model, HttpSession session, UserInfo userInfo) {
        UserInfo oldUserInfo = userDao.getByName(userInfo.getUserName());
        if (oldUserInfo == null) {
            userDao.register(userInfo);
            return "redirect:../user/registerSuccess.jsp";
        } else {
            session.setAttribute("msg", "用户名已存在");
            return "redirect:../user/register.jsp";
        }
    }
    
    @RequestMapping(value = "login")
    public String login(Model model, HttpSession session, UserInfo userInfo) {
        UserInfo oldUserInfo = userDao.getByName(userInfo.getUserName());
        if(oldUserInfo == null) {
            session.setAttribute("msg", "用户不存在");
            return "redirect:../user/login.jsp";
        }
        if(userInfo.getPassword().equals(oldUserInfo.getPassword())) {
            session.setAttribute("userInfo", oldUserInfo);
            session.setAttribute("unameNext", "退出登录");
            
//            new CartCtl().loginCart(, oldUserInfo.getId());
            return session.getAttribute("lastUrl").toString();
        }
        session.setAttribute("msg", "密码错误");
        return "redirect:../user/login.jsp";
    }

    @RequestMapping(value = "rg_lg_do")
    public String rg_lg_do(Model model, HttpSession session, String rorl) {
        // 登录状态
        if (session.getAttribute("userInfo") != null) {
            session.setAttribute("unameNext", "退出登录");
            // 点击用户名
            if ("login".equals(rorl)) {
                Integer userId = ((UserInfo) session.getAttribute("userInfo")).getId();
                UserInfo userInfo = userDao.getById(userId);
                List<OrderForm> forms = orderDao.getFormByUserId(userInfo.getId());
                model.addAttribute("orders", forms);
                List<OrderDetail> details = orderDao.getAllDetailsByUserId(userInfo.getId());
                model.addAttribute("details", details);
                return "userarea.jsp";
            }
            // 点击退出登录
            else if ("register".equals(rorl)) {
                session.removeAttribute("userInfo");
                if (session.getAttribute("lastUrl") == null)
                    session.setAttribute("lastUrl", "redirect:../index.jsp");
                return "redirect:../user/login.jsp";
            } else
                return "redirect:../index.jsp";
        }
        // 非登录状态
        else {
            if ("register".equals(rorl))
                return "redirect:../user/register.jsp";
            else if ("login".equals(rorl)) {
                session.setAttribute("lastUrl", "redirect:../index.jsp");
                return "redirect:../user/login.jsp";
            } else
                return "redirect:../index.jsp";
        }
    }

}
