package uz.pdp.lesson.service;

import uz.pdp.lesson.model.products.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private List<Products> products = new ArrayList<>();

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
