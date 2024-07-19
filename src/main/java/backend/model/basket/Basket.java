package backend.model.basket;

import lombok.Data;
import lombok.NoArgsConstructor;
import backend.enums.BasketStatus;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class Basket {
    private int id;
    private Timestamp orderDate;
    private BasketStatus status;
    private int consumerId;
}