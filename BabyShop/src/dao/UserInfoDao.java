package dao;

import java.util.Date;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import dao.tables.UserInfo;
import dao.util.UtilFactory;

@Repository
public class UserInfoDao {

    // 返回所有哟用户
    @SuppressWarnings("unchecked")
    public List<UserInfo> getAllUsers() {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from UserInfo");
        List<UserInfo> users = (List<UserInfo>) query.list();

        tx.commit();
        session.close();
        return users;
    }

    // 注册一个用户
    public UserInfo register(UserInfo userInfo) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        userInfo.setDate(new Date());
        session.save(userInfo);

        tx.commit();
        session.close();
        return userInfo;
    }

    // 删除一个用户
    public void delUser(Integer userId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        session.delete(getById(userId));

        tx.commit();
        session.close();
    }

    // 基于id更新一个用户信息
    public UserInfo update(Integer userId, UserInfo userInfo) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        UserInfo user = (UserInfo) session.get(UserInfo.class, userId);
        user.setUserName(userInfo.getUserName());
        user.setPassword(userInfo.getPassword());
        user.setAge(userInfo.getAge());
        user.setAddress(userInfo.getAddress());

        tx.commit();
        session.close();
        return user;
    }

    // 根据id修改密码
    public boolean rePassword(Integer userId, String password) {
        return false;
    }

    // 基于id查询用户信息
    public UserInfo getById(Integer userId) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        UserInfo userInfo = (UserInfo) session.get(UserInfo.class, userId);

        tx.commit();
        session.close();
        return userInfo;
    }

    // 基于用户名查询用户信息
    public UserInfo getByName(String userName) {
        Session session = UtilFactory.getSession();
        Transaction tx = session.beginTransaction();

        Query query = session.createQuery("from UserInfo where userName = ?");
        query.setString(0, userName);
        UserInfo userInfo = (UserInfo) query.uniqueResult();

        tx.commit();
        session.close();
        return userInfo;
    }

    // 基于名字模糊查询 返回所有符合条件的员工
    public List<UserInfo> getAllEmps(String userName) {
        return null;
    }

    /***
     * 分页查询
     * 
     * @param start_index
     *            起始下标
     * @param count
     *            每页的记录数
     * @return 返回一页记录
     */
    public List<UserInfo> getPageRows(int start_index, int count) {
        return null;
    }

}
