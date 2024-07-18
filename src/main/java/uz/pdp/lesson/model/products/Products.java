package uz.pdp.lesson.model.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Products {
    private int id;
    private String name;
    private int price;
    private String description;
    private int count;
    private String category;
    private String createDate;
    private int marketId;
    private String imageBase64;
    private String imageUrl;

    public Products(int id, String description, int price) {
        this.id = id;
        this.name = description;
        this.price = price;
    }

}
