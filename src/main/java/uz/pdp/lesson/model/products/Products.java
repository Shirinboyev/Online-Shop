package uz.pdp.lesson.model.products;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Base64;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Products {
    private int id;
    private String name;
    private int productId;
    private double price;
    private String description;
    private int count;
    private String category;
    private Timestamp createDate;
    private String imageUrl;
    private int marketId;
    private String imageBase64;

    public Products(int id, String yozgiOyoqKiyim, double price) {
        this.id = id;
        this.name = yozgiOyoqKiyim;
        this.price = price;
    }
}
