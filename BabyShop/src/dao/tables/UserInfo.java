package dao.tables;

import java.util.Date;

public class UserInfo {
    private Integer id;
    private String userName;
    private String password;
    private Integer age;
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "UserInfo [id=" + id + ", userName=" + userName + ", password=" + password + ", age=" + age + ", date="
                + date + "]";
    }

}
