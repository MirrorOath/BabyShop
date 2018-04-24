package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.CartDao;
import dao.CommodityDao;
import dao.OrderDao;
import dao.UserInfoDao;
import dao.tables.CommodityInfo;
import dao.tables.UserInfo;

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

    @RequestMapping(value = "addCmty", method = RequestMethod.POST)
    public String addCmty(Model model, MultipartFile image, HttpServletRequest request,
            String name, String category, String note, Integer price) {

        if (name == null || category == null || price == null || "".equals(name) || cmtyDao.getByName(name) != null) {
            return "control.jsp";
        } else {
            CommodityInfo cmty = new CommodityInfo();
            cmty.setName(name);
            cmty.setCategory(category);
            cmty.setPrice(price);
            cmty.setImageSrc(PhotoUtil.saveFile(image, request));
            cmty.setNote(note);
            System.out.println(cmty.toString());
            cmtyDao.addCommodity(cmty);
            return "addCmty.jsp";
        }
    }

    @RequestMapping(value = "queryUsers")
    public String queryUsers(Model model, HttpSession session) {
        List<UserInfo> users = userDao.getAllUsers();
        model.addAttribute("users", users);
        return "../admin/userInfo.jsp";
    }

    @RequestMapping(value = "queryCmties")
    public String queryCmties(Model model, HttpSession session) {
        List<CommodityInfo> cmties = cmtyDao.getAllCmties();
        model.addAttribute("cmties", cmties);
        return "../admin/cmties.jsp";
    }

    @RequestMapping(value = "delUser")
    public String delUser(Model model, HttpSession session, Integer userId) {
        userDao.delUser(userId);
        return queryUsers(model, session);
    }

    @RequestMapping(value = "easyUIGetUsers")
    public @ResponseBody List<UserInfo> easyUIGetUsers() {
        List<UserInfo> users = userDao.getAllUsers();
        for (UserInfo user : users)
            System.out.println(user);
        return users;
    }

    @RequestMapping(value = "easyUISaveUser")
    public @ResponseBody UserInfo easyUISaveUser(UserInfo userInfo) {
        UserInfo user = userDao.register(userInfo);
        return user;
    }

    @RequestMapping(value = "easyUIDelUser")
    public @ResponseBody boolean easyUIDelUsers(UserInfo userInfo) {
        userDao.delUser(userInfo.getId());
        return true;
    }

    @RequestMapping(value = "easyUIUpdateUser")
    public @ResponseBody UserInfo easyUIUpdateUser(Integer id, String userName, String password, Integer age) {
        UserInfo oldInfo = new UserInfo();
        oldInfo.setId(id);
        oldInfo.setUserName(userName);
        oldInfo.setPassword(password);
        oldInfo.setAge(age);
        UserInfo user = userDao.update(id, oldInfo);
        return user;
    }
}
