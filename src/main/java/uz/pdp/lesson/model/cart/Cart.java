package uz.pdp.lesson.model.cart;


import uz.pdp.lesson.model.products.Products;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Cart {
    private int id;
    private int userId;
    private Date createDate;
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public Cart(int userId) {
        this.userId = userId;
        this.createDate = new Date();
        this.items = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
    public void addProduct(Products product, int quantity) {
        for (CartItem item : items) {
            if (item.getProductId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        this.items.add(new CartItem(this.id, product.getId(), quantity));
    }
}
