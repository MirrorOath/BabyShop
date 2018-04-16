package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import dao.tables.CartInfo;
import dao.util.UtilFactory;

@Repository
public class CartDao {

    // 根据用户id返回他的购物车信息
    @SuppressWarnings("unchecked")
    public List<CartInfo> getCartsByUserId(Integer userId){
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from CartInfo where userId = ?");
        query.setString(0, userId.toString());
        List<CartInfo> carts = (List<CartInfo>) query.list();
        
        tx.commit();
        session.close();
        return carts;
    }
    
}
