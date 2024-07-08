package uz.pdp.lesson.model.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Ptoducts {
    private int productId;
    private String name;
    private String description;
    private double price;
    private int stock;
    private int categoryId;
}
