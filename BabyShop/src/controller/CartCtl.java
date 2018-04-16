package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDao;
import dao.CommodityDao;
import dao.OrderDao;
import dao.UserInfoDao;
import dao.tables.CartInfo;
import dao.tables.UserInfo;

@Controller
@RequestMapping(value = "/cart/")
public class CartCtl {
    @Autowired
    private UserInfoDao userDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private CommodityDao cmtyDao;
    @Autowired
    private CartDao cartDao;

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "seeCart")
    public String seeCart(Model model, HttpSession session, Integer userId) {
        List<CartInfo> cartInfo = userId != null ? cartDao.getCartsByUserId(userId)
                : (List<CartInfo>) session.getAttribute("runCarts");

        model.addAttribute("cartInfo", cartInfo);
        return "../user/cart.jsp";
    }

}
