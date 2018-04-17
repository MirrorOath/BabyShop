package controller;

import java.util.ArrayList;
import java.util.Date;
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

    private void getCmtyInfos(List<CartInfo> carts) {
        for (CartInfo cart : carts) {
            cart.setCmty(cmtyDao.getById(cart.getCommodityId()));
        }
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "seeCart")
    public String seeCart(Model model, HttpSession session, Integer userId) {
        List<CartInfo> cartInfos = session.getAttribute("userInfo") != null
                ? cartDao.getCartsByUserId(((UserInfo) session.getAttribute("userInfo")).getId())
                : (List<CartInfo>) session.getAttribute("runCarts");
        if (cartInfos != null)
            getCmtyInfos(cartInfos);
        model.addAttribute("cartInfo", cartInfos);
        return "../user/cart.jsp";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "addcmty")
    public String addcmty(Model model, HttpSession session, Integer userId, Integer cmtyId) {

        CartInfo cart = new CartInfo();
        cart.setCommodityId(cmtyId);
        cart.setDate(new Date());
        cart.setCount(1);

        if (userId == null || userDao.getById(userId) == null) {
            boolean isIn = false;
            List<CartInfo> carts = (List<CartInfo>) session.getAttribute("runCarts");
            if (carts == null)
                carts = new ArrayList<CartInfo>();
            for (CartInfo c : carts) {
                if (c.getCommodityId() == cmtyId) {
                    c.setCount(c.getCount() + 1);
                    isIn = true;
                    break;
                }
            }
            if (!isIn)
                carts.add(cart);
            getCmtyInfos(carts);
            session.setAttribute("runCarts", carts);
        } else {
            cart.setUserId(userId);
            cartDao.addCmty(cart);
        }
        return "redirect:../cmty/cmtyInfo.action?cmtyId=" + cmtyId;
    }

    public static void removeCart(List<CartInfo> list, Integer cmtyId) {
        for (int i = list.size() - 1; i >= 0; i--) {
            CartInfo item = list.get(i);
            if (cmtyId == item.getCommodityId()) {
                list.remove(item);
            }
        }
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "delCart")
    public String delCart(Model model, HttpSession session, Integer cmtyId) {
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        if (userInfo == null || userDao.getById(userInfo.getId()) == null) {
            List<CartInfo> carts = (List<CartInfo>) session.getAttribute("runCarts");
            if (carts == null)
                carts = new ArrayList<CartInfo>();
            removeCart(carts, cmtyId);
            // getCmtyInfos(carts);
            session.setAttribute("runCarts", carts);
        } else {
            cartDao.delCart(cartDao.searchCart(userInfo.getId(), cmtyId));
        }
        return seeCart(model, session, userInfo == null ? null : userInfo.getId());
    }

    public void loginCart(List<CartInfo> carts, Integer userId) {
        if (carts == null)
            return;
        // CartInfo cart = new CartInfo();
        for (CartInfo c : carts) {
            c.setUserId(userId);
            // cart.setCommodityId(c.getCommodityId());
            // cart.setCount(c.getCount());
            // cart.setDate(new Date());
            // cart.setUserId(userId);
            // System.out.println(cart.toString());
            // cart.setCmty(
            // cmtyDao.getById(
            // c.getCommodityId()));
            cartDao.addCmty(c);
        }
    }

}
