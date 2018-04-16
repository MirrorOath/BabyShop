package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import dao.tables.OrderDetail;
import dao.tables.OrderForm;
import dao.util.UtilFactory;

@Repository
public class OrderDao {

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

    // 根据用户id获得订单单条记录
    public List<OrderDetail> getAllDetailsByUserId(Integer userId) {
        return null;
    }
}
