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
    public List<CartInfo> getCartsByUserId(Integer userId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from CartInfo where userId = ?");
        query.setString(0, userId.toString());
        List<CartInfo> carts = (List<CartInfo>) query.list();

        tx.commit();
        session.close();
        return carts;
    }

    // 根据用户id和商品id添加一条购物车记录
    public boolean addCmty(CartInfo cart) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        CartInfo oldInfo = searchCart(cart.getUserId(), cart.getCommodityId());
        if(oldInfo == null)
            session.save(cart);
        else {
            oldInfo.setCount(oldInfo.getCount() + 1);
            session.save(oldInfo);
        }

        tx.commit();
        session.close();
        return true;
    }

    // 根据商品id和用户id返回一条购物车记录
    public CartInfo searchCart(Integer userId, Integer cmtyId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from CartInfo where userId = ? and cmtyId = ?");
        query.setString(0, userId.toString());
        query.setString(1, cmtyId.toString());
        CartInfo cart = (CartInfo) query.uniqueResult();

        tx.commit();
        session.close();
        return cart;
    }

}
