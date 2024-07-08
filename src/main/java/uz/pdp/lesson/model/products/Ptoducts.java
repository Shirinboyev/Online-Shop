package uz.pdp.lesson.model.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.security.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Ptoducts {
    private int id;
    private String name;
    private int productId;
    private double price;
    private String description;
    private int count;
    private int categoryId;
    private Timestamp create_date;
    private String imageUrl;
    private int marketId;
}
