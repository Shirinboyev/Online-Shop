package uz.pdp.lesson.service;

import uz.pdp.lesson.model.cart.CartItem;
import uz.pdp.lesson.model.orders.OrderDetails;
import uz.pdp.lesson.repository.OrderDetailsRepository;

import java.sql.SQLException;
import java.util.List;

public class OrderDetailsService {
    private static OrderDetailsService orderDetailsService;
    private static final ProductService productService = ProductService.getInstance();
    private static final OrderDetailsRepository orderDetailsRepository = OrderDetailsRepository.getInstance();
    private static final CartService cartService = CartService.getInstance();

    private OrderDetailsService() {
        // Private constructor to prevent instantiation
    }

    public static OrderDetailsService getInstance() {
        if (orderDetailsService == null) {
            orderDetailsService = new OrderDetailsService();
        }
        return orderDetailsService;
    }

    public void save(OrderDetails orderDetails, List<CartItem> items) throws SQLException {
        orderDetailsRepository.save(orderDetails);
        cartService.deleteItemsByCartId(orderDetails.getCart_id());
        productService.reduceAmountOfProductByProductId(items);
    }
}
