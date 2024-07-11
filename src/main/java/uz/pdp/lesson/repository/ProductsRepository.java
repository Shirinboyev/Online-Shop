package uz.pdp.lesson.repository;

import uz.pdp.lesson.model.products.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.lesson.repository.BaseRepository.*;

public class ProductsRepository implements BaseRepository<Products> {

    public void save(Products product) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String query = "INSERT INTO product (name, price, description, count, image, market_id,category) VALUES ( ?,?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCount());
            statement.setString(5, product.getImageUrl());
            statement.setInt(6, product.getMarketId());
            statement.setString(7,product.getCategory());
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
    public List<Products> getAll() {
        return List.of();
    }


    public Products getProductById(int id) {
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

    public List<Products> getAllProducts() {
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
        return Products.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .productId(resultSet.getInt("product_id"))
                .price(resultSet.getDouble("price"))
                .description(resultSet.getString("description"))
                .count(resultSet.getInt("count"))
                .category(resultSet.getString("category"))
                .createDate(resultSet.getTimestamp("create_date"))
                .imageUrl(resultSet.getString("image"))
                .marketId(resultSet.getInt("market_id"))
                .build();
    }
}
