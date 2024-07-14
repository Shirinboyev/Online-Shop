package uz.pdp.lesson.repository;

import uz.pdp.lesson.imageEncoder.ImageEncoder;
import uz.pdp.lesson.model.products.Products;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class ProductsRepository implements BaseRepository<Products> {

    private void forDriver() {
        try {
            Class.forName("org.postgresql.Driver"); // Register the driver
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found. Include it in your library path.", e);
        }
    }

    public void save(Products product) {
        forDriver();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "INSERT INTO product (name, price, description, count, image, market_id, category, create_date, image_base64) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCount());
            statement.setString(5, product.getImageUrl());
            statement.setInt(6, product.getMarketId());
            statement.setString(7, product.getCategory());
            statement.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
            statement.setString(9, ImageEncoder.encodeImage(product.getImageUrl()));

            // Debugging statements
            System.out.println("Executing query: " + statement);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new product was inserted successfully!");
            } else {
                System.out.println("Failed to insert the product.");
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Products get(Integer id) {
        forDriver();
        Products product = null;
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "SELECT * FROM product WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                product = productMapping(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Products> getAll() {
        return getAllProducts();
    }

    public List<Products> getAllProducts() {
        forDriver();
        List<Products> productsList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "SELECT * FROM product";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Products product = productMapping(resultSet);
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }

    private static Products productMapping(ResultSet resultSet) throws SQLException {
        String imageBase64 = resultSet.getString("image_base64");

        Products product = Products.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .price(resultSet.getDouble("price"))
                .description(resultSet.getString("description"))
                .count(resultSet.getInt("count"))
                .category(resultSet.getString("category"))
                .imageUrl(resultSet.getString("image"))
                .marketId(resultSet.getInt("market_id"))
                .build();

        if (imageBase64 != null) {
            byte[] decodedBytes = Base64.getDecoder().decode(imageBase64);
            product.setImageUrl(new String(decodedBytes));
        }
        return product;
    }
    public Products getProductById(int productId) {
        Products product = null;
        String query = "SELECT * FROM product WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Products();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image_base64"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }
}
