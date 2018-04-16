package dao.tables;

public class CommodityInfo {

    private Integer id;
    private String category;
    private String name;
    private Integer price;
    private String imageSrc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    @Override
    public String toString() {
        return "CommodityInfo [id=" + id + ", category=" + category + ", name=" + name + ", price=" + price
                + ", imageSrc=" + imageSrc + "]";
    }

}
