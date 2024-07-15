/*alter table product
add column image_base64 text;*/
CREATE TABLE cart (
                      id INT PRIMARY KEY,
                      user_id INT NOT NULL,
                      create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE cart_items (
                            id INT  PRIMARY KEY,
                            cart_id INT NOT NULL,
                            product_id INT NOT NULL,
                            quantity INT DEFAULT 1,
                            FOREIGN KEY (cart_id) REFERENCES cart(id),
                            FOREIGN KEY (product_id) REFERENCES product(id)
);
