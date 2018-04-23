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
import dao.tables.CommodityInfo;
import dao.util.PageBean;

@Controller
@RequestMapping(value = "/cmty/")
public class CommodityCtl {
    @Autowired
    private UserInfoDao userDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private CommodityDao cmtyDao;
    @Autowired
    private CartDao cartDao;

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "changePage")
    private String changePage(Model model, HttpSession session, Integer page) {
        System.out.println("changePage");
        PageBean<CommodityInfo> cmtyBean = (PageBean<CommodityInfo>) session.getAttribute("pageBean");
        if (cmtyBean == null)
            return "redirect:../index.jsp";
        cmtyBean.setCurrentPage(page > 0 && page <= cmtyBean.getTotalPage() ? page : cmtyBean.getCurrentPage());
        cmtyDao.getPageCommoditiesByName(cmtyBean, cmtyBean.getCmtyName());
        List<CommodityInfo> cmties = cmtyBean.getPageData();
        session.setAttribute("pageBean", cmtyBean);
        model.addAttribute("cmties", cmties);
        return "../user/search.jsp";
    }

    @RequestMapping(value = "changeCategory")
    private String changeCategory(Model model, HttpSession session, String category) {
        session.setAttribute("category", category);
        return "redirect:../user/search.jsp";
    }

    @RequestMapping(value = "OldsearchByName")
    public String OldsearchByName(Model model, HttpSession session, String commodityName) {
        session.removeAttribute("lastPage");
        session.removeAttribute("nextPage");
        if ("".equals(commodityName)) {
            // return "../user/search.jsp";
        }
        PageBean<CommodityInfo> cmtyPage = new PageBean<CommodityInfo>();
        cmtyPage.setCmtyName(commodityName);
        cmtyPage.setPageCount(12);

        cmtyDao.getPageCommoditiesByName(cmtyPage, commodityName);
        session.setAttribute("pageBean", cmtyPage);
        session.removeAttribute("category");
        return changePage(model, session, 1);
    }

    @RequestMapping(value = "searchByName")
    public String searchByName(Model model, HttpSession session, String commodityName) {
        List<CommodityInfo> cmties = cmtyDao.CmtyLike(commodityName);
        session.setAttribute("cmties", cmties);
        session.removeAttribute("category");
        return "redirect:../user/search.jsp";
    }

    @RequestMapping(value = "cmtyInfo")
    public String cmtyInfo(Model model, HttpSession session, Integer cmtyId) {
        CommodityInfo cmty = cmtyDao.getById(cmtyId);
        model.addAttribute("cmty", cmty);
        return "../user/commodityInfo.jsp";
    }

}
