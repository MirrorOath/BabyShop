package dao.tables;

import java.util.Date;

public class CartInfo {
    private Integer id;
    private Integer userId;
    private Integer commodityId;
    private Integer count;
    private Date date;
    private CommodityInfo cmty;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public CommodityInfo getCmty() {
        return cmty;
    }

    public void setCmty(CommodityInfo cmty) {
        this.cmty = cmty;
    }

    @Override
    public String toString() {
        return "CartInfo [id=" + id + ", userId=" + userId + ", commodityId=" + commodityId + ", count=" + count
                + ", date=" + date + "]";
    }

}
