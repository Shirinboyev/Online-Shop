package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.products.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class ProductsRepository implements BaseRepository<Products> {

    public void save(Products product) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "INSERT INTO products (name, product_id, price, description, count, category_id, create_date, image_url, market_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setInt(2, product.getProductId());
            statement.setDouble(3, product.getPrice());
            statement.setString(4, product.getDescription());
            statement.setInt(5, product.getCount());
            statement.setInt(6, product.getCategoryId());
            statement.setTimestamp(7, product.getCreateDate());
            statement.setString(8, product.getImageUrl());
            statement.setInt(9, product.getMarketId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Products get(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<Products> getAll() {
        return List.of();
    }

    @Override
    public boolean update(Products old, Products updated) {
        return false;
    }

    public Products getProductById(int id) {
        Products product = null;
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "SELECT * FROM products WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                product = Products.builder()
                        .id(resultSet.getInt("id"))
                        .name(resultSet.getString("name"))
                        .productId(resultSet.getInt("product_id"))
                        .price(resultSet.getDouble("price"))
                        .description(resultSet.getString("description"))
                        .count(resultSet.getInt("count"))
                        .categoryId(resultSet.getInt("category_id"))
                        .createDate(resultSet.getTimestamp("create_date"))
                        .imageUrl(resultSet.getString("image_url"))
                        .marketId(resultSet.getInt("market_id"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Products> getAllProducts() {
        List<Products> productsList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "SELECT * FROM products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Products product = Products.builder()
                        .id(resultSet.getInt("id"))
                        .name(resultSet.getString("name"))
                        .productId(resultSet.getInt("product_id"))
                        .price(resultSet.getDouble("price"))
                        .description(resultSet.getString("description"))
                        .count(resultSet.getInt("count"))
                        .categoryId(resultSet.getInt("category_id"))
                        .createDate(resultSet.getTimestamp("create_date"))
                        .imageUrl(resultSet.getString("image_url"))
                        .marketId(resultSet.getInt("market_id"))
                        .build();
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }
}
