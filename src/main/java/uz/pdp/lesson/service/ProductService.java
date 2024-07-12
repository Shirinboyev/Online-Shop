package uz.pdp.lesson.service;

import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.ProductsRepository;

public class ProductService {
    private static ProductService productService;
    private final ProductsRepository productsRepository;

    private ProductService() {
        this.productsRepository = new ProductsRepository();
    }

    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    public void addProduct(String productCategory, int marketId, String productName, double productPrice, String productDescription, int productCount, String productImageUrl) {
        Products product = new Products();
        product.setName(productName);
        product.setPrice(productPrice);
        product.setDescription(productDescription);
        product.setMarketId(marketId);
        product.setCount(productCount);
        product.setImageUrl(productImageUrl);
        product.setCategory(productCategory);
        productsRepository.save(product);
    }
}
