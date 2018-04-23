package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import dao.tables.CommodityInfo;
import dao.util.PageBean;
import dao.util.UtilFactory;

@Repository
public class CommodityDao {

    // 根据商品名分页查询商品
    @SuppressWarnings("unchecked")
    public void getPageCommoditiesByName(PageBean<CommodityInfo> cmtyPage, String cmtyName) {
        Session session = UtilFactory.getSession();
        Query query = session.createQuery("from CommodityInfo where name like ?");
        query.setString(0, "%" + cmtyName + "%");
        // 统计总记录数
        // 得到滚动结果集
        ScrollableResults scroll = query.scroll();
        // 滚动到最后记录的位置
        scroll.last();
        // scroll.getRowNumber()从0开始计数的
        int totalCount = scroll.getRowNumber() + 1;
        cmtyPage.setTotalCount(totalCount);
        // 设置分页参数
        // 从第几条记录开始取数据
        query.setFirstResult((cmtyPage.getCurrentPage() - 1) * cmtyPage.getPageCount());
        // 每次取几条数据
        query.setMaxResults(cmtyPage.getPageCount());
        List<CommodityInfo> commdities = (List<CommodityInfo>) query.list();
        cmtyPage.setPageData(commdities);
    }

    // 添加一个新商品
    public boolean addCommodity(CommodityInfo cmty) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        session.save(cmty);

        tx.commit();
        session.close();
        return true;
    }

    // 根据商品名寻找一个商品
    public CommodityInfo getByName(String name) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from CommodityInfo where name = ?");
        query.setString(0, name);
        CommodityInfo cmty = (CommodityInfo) query.uniqueResult();

        tx.commit();
        session.close();
        return cmty;
    }

    // 根据商品名模糊查询所有商品
    @SuppressWarnings("unchecked")
    public List<CommodityInfo> CmtyLike(String name) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from CommodityInfo where name like ?");
        query.setString(0, "%" + name + "%");
        List<CommodityInfo> cmties = (List<CommodityInfo>) query.list();

        tx.commit();
        session.close();
        return cmties;
    }

    // 根据商品id寻找一个商品
    public CommodityInfo getById(Integer id) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        CommodityInfo cmty = (CommodityInfo) session.get(CommodityInfo.class, id);

        tx.commit();
        session.close();
        return cmty;
    }

    @SuppressWarnings("unchecked")
    public List<CommodityInfo> getAllCmties() {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from CommodityInfo");
        List<CommodityInfo> cmties = (List<CommodityInfo>) query.list();

        tx.commit();
        session.close();
        return cmties;
    }

}
