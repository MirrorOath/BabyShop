package controller;

import java.util.ArrayList;
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
import dao.tables.OrderDetail;
import dao.tables.OrderForm;
import dao.tables.UserInfo;

@Controller
@RequestMapping(value = "/order/")
public class OrderCtl {
    @Autowired
    private UserInfoDao userDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private CommodityDao cmtyDao;
    @Autowired
    private CartDao cartDao;

    @RequestMapping(value = "placeOrder")
    public String placeOrder(Model model, HttpSession session, Integer[] cartCmtyId) {
        if (cartCmtyId == null)
            return "redirect:../user/seeCart.action";
        Integer userId = ((UserInfo) session.getAttribute("userInfo")).getId();
        List<CartInfo> carts = new ArrayList<CartInfo>();
        for (Integer CmtyId : cartCmtyId) {
            carts.add(cartDao.searchCart(userId, CmtyId));
        }
        Integer formId = orderDao.plaseOrder(carts, userId);
        return seeDetail(model, session, formId);
    }

    @RequestMapping(value = "seeDetail")
    public String seeDetail(Model model, HttpSession session, Integer formId) {
        List<OrderDetail> details = orderDao.getDetailsByFormId(formId);
        model.addAttribute("details", details);
        model.addAttribute("form", orderDao.getOrderFormByFormId(formId));
        return "../user/oFormInfo.jsp";
    }
    
    @RequestMapping(value = "delForm")
    public String delForm(Model model, HttpSession session, Integer formId) {
        orderDao.delOrderFormAndDetails(formId);
        Integer userId = ((UserInfo) session.getAttribute("userInfo")).getId();
        UserInfo userInfo = userDao.getById(userId);
        List<OrderForm> forms = orderDao.getFormByUserId(userInfo.getId());
        model.addAttribute("orders", forms);
        List<OrderDetail> details = orderDao.getAllDetails(userInfo.getId());
        model.addAttribute("details", details);
        return "../user/userarea.jsp";
    }

}
