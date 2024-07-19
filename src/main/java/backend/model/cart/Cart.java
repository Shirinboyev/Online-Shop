package backend.model.cart;

import backend.model.products.Products;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
public class Cart {
    private int id;
    private int userId;
    private Date createDate;
    private boolean isPaid = false;
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public Cart(int userId) {
        this.userId = userId;
        this.createDate = new Date();
        this.items = new ArrayList<>();
        this.isPaid = false; // Default to unpaid
    }

    public void addProduct(Products product, int quantity) {
        for (CartItem item : items) {
            if (item.getProductId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        this.items.add(new CartItem(this.id, product.getId(), quantity, false));
    }

    public void setPaid(boolean paid) {
        this.isPaid = paid;
        for (CartItem item : items) {
            item.setPaid(paid);
        }
    }
}
