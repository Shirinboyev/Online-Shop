package uz.pdp.lesson.model.cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    private int id;
    private int userId;
    private int productId;
    private int quantity;

    public CartItem(int id, int userId, int productId) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
    }
}
