package uz.pdp.lesson.service;

import uz.pdp.lesson.model.products.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private List<Products> products = new ArrayList<>();

    public ProductService() {
        // Add sample products
        products.add(new Products(1, "Yozgi oyoq kiyim", 99000));
        products.add(new Products(2, "Quyoshdan ximoya uchun kepka", 59000));
        products.add(new Products(3, "Quyoshdan ximoya uchun ko'zoynak", 49000));
        products.add(new Products(4, "Anor suvi", 12000));
        products.add(new Products(5, "Komputer uchun mishka", 139000));
        products.add(new Products(6, "Boshdan oyoq sarpo", 199000));
    }

    public List<Products> getProductsByIds(List<Integer> productIds) {
        List<Products> result = new ArrayList<>();
        for (Products product : products) {
            if (productIds.contains(product.getId())) {
                result.add(product);
            }
        }
        return result;
    }
}
