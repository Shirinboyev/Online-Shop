package uz.pdp.lesson.model.card;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CardItem {
    private int cartItemId;
    private int cartId;
    private int productId;
    private int quantity;
}
