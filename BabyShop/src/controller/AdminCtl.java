package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDao;
import dao.CommodityDao;
import dao.OrderDao;
import dao.UserInfoDao;
import dao.tables.CommodityInfo;

@Controller
@RequestMapping(value = "/admin/")
public class AdminCtl {
    @Autowired
    private UserInfoDao userDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private CommodityDao cmtyDao;
    @Autowired
    private CartDao cartDao;

    @RequestMapping(value = "addCmty")
    public String addCmty(Model model, HttpSession session, CommodityInfo cmty) {
        cmty.setImageSrc("image/book.jpg");
        CommodityInfo oldInfo = cmtyDao.getByName(cmty.getName());
        if (oldInfo == null) {
            cmtyDao.addCommodity(cmty);
            String str = cmty.getName();
            for (int i = 1; i < 100; i++) {
                cmty.setName(str + i);
                cmtyDao.addCommodity(cmty);
            }
            return "control.jsp";
        } else {
            model.addAttribute("msg", "书已存在");
            return "control.jsp";
        }
    }

}
