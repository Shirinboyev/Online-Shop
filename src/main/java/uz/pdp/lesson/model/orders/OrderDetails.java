package uz.pdp.lesson.model.orders;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.lesson.enums.BasketStatus;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderDetails {
    private int id;
    private double price;
    private int cart_id;
    private Timestamp ordered_date;
}
