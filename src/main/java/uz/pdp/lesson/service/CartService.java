package uz.pdp.lesson.service;

import uz.pdp.lesson.model.cart.CartItem;

import java.util.ArrayList;
import java.util.List;

public class CartService {

    private List<CartItem> cartItems = new ArrayList<>();

    public void addCartItem(CartItem cartItem) {
        cartItems.add(cartItem);
    }

    public List<CartItem> getCartItemsByUserId(int userId) {
        List<CartItem> userCartItems = new ArrayList<>();
        for (CartItem cartItem : cartItems) {
            if (cartItem.getUserId() == userId) {
                userCartItems.add(cartItem);
            }
        }
        return userCartItems;
    }
}
