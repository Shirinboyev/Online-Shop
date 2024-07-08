package uz.pdp.lesson.model.orders;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.security.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Orders {
    private int orderId;
    private int userId;
    private Timestamp orderDate;
    private double totalAmount;

}
