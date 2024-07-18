package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.orders.OrderDetails;
import uz.pdp.lesson.model.products.Products;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class ProductsRepository implements BaseRepository<Products> {

    private void forDriver() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found. Include it in your library path.", e);
        }
    }

    public void save(Products product) {
        forDriver();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "INSERT INTO product (name, price, description, count, image_base64, market_id, category, create_date,image) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCount());
            statement.setString(5, product.getImageBase64());
            statement.setInt(6, product.getMarketId());
            statement.setString(7, product.getCategory());
            statement.setString(9, product.getImageUrl());
            statement.setTimestamp(8, new Timestamp(System.currentTimeMillis()));

            System.out.println("Executing query: " + statement);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new product was inserted successfully!");
            } else {
                System.out.println("Failed to insert the product.");
            }
        } catch (SQLException e) {
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
            String query = "SELECT * FROM product where count > 0";
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
                .price(resultSet.getInt("price"))
                .description(resultSet.getString("description"))
                .count(resultSet.getInt("count"))
                .category(resultSet.getString("category"))
                .imageUrl(resultSet.getString("image"))
                .imageBase64(resultSet.getString("image_base64"))
                .marketId(resultSet.getInt("market_id"))
                .build();
        return product;
    }

    public List<Products> getProductsByMarketId(Integer marketId) {
        forDriver();
        List<Products> productsList = new ArrayList<>();
        String query = "SELECT * FROM product WHERE market_id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, marketId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Products product = productMapping(resultSet);
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }
    public List<Products> getProductsByIds(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return new ArrayList<>();
        }

        String sql = "SELECT * FROM product WHERE id IN (" + String.join(",", ids.stream().map(String::valueOf).toArray(String[]::new)) + ")";
        List<Products> products = new ArrayList<>();

        try (Connection connection = BaseRepository.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Products product = new Products();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getInt("price"));
                product.setDescription(resultSet.getString("description"));
                product.setCount(resultSet.getInt("count"));
                product.setCategory(resultSet.getString("category"));
                product.setImageUrl(resultSet.getString("image"));
                product.setMarketId(resultSet.getInt("market_id"));
                product.setImageBase64(resultSet.getString("image_base64")); // Assuming this is the correct field
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

}