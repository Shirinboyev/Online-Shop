package backend.model.cart;

import lombok.Data;

@Data
public class CartItem {
    private int id;
    private int cartId;
    private int productId;
    private int quantity;
    private boolean isPaid;

    public CartItem() {}

    public CartItem(int cartId, int productId, int quantity, boolean isPaid) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.isPaid = false;
    }

}
