package dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.tables.CartInfo;
import dao.tables.OrderDetail;
import dao.tables.OrderForm;
import dao.tables.UserInfo;
import dao.util.UtilFactory;

@Repository
public class OrderDao {
    @Autowired
    private CartDao cartDao;
    @Autowired
    private CommodityDao cmtyDao;

    // 根据用户id获得用户的购物订单
    @SuppressWarnings("unchecked")
    public List<OrderForm> getFormByUserId(Integer userId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from OrderForm where userId = ?");
        query.setString(0, userId.toString());
        List<OrderForm> forms = (List<OrderForm>) query.list();

        tx.commit();
        session.close();
        return forms;
    }

    // 获得所有详单信息
    @SuppressWarnings("unchecked")
    public List<OrderDetail> getAllDetails(Integer userId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from OrderDetail");
        List<OrderDetail> details = (List<OrderDetail>) query.list();
        for (OrderDetail detail : details) {
            detail.setCmty(cmtyDao.getById(detail.getCommodityId()));
        }

        tx.commit();
        session.close();
        return details;
    }

    // 根据订单号获得详单信息
    @SuppressWarnings("unchecked")
    public List<OrderDetail> getDetailsByFormId(Integer formId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from OrderDetail where formId = ?");
        query.setString(0, formId.toString());
        List<OrderDetail> details = (List<OrderDetail>) query.list();
        for (OrderDetail detail : details) {
            detail.setCmty(cmtyDao.getById(detail.getCommodityId()));
        }

        tx.commit();
        session.close();
        return details;
    }

    // 根据购物车选中链表生成账单
    public Integer plaseOrder(List<CartInfo> carts, Integer userId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        OrderForm orderForm = new OrderForm();
        orderForm.setUserId(userId);
        orderForm.setAddress("Gallifrey星，Kasterborous星群，坐标(10-0-11-0-0，0-2)");
        orderForm.setExInfo("未付账");
        orderForm.setDate(new Date());
        orderForm.setTotalPrice(1991.0919D);

        session.save(orderForm);

        for (CartInfo cart : carts) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setFormId(orderForm.getId());
            orderDetail.setCount(cart.getCount());
            orderDetail.setCommodityId(cart.getCommodityId());
            orderDetail.setPrice(1);
            session.save(orderDetail);
            cartDao.delCart(cartDao.searchCart(userId, cart.getCommodityId()));
        }

        tx.commit();
        session.close();
        return orderForm.getId();
    }

    // 根据订单id获取订单
    public OrderForm getOrderFormByFormId(Integer formId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        OrderForm form = (OrderForm) session.get(OrderForm.class, formId);

        tx.commit();
        session.close();
        return form;
    }

}
