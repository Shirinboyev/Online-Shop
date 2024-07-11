package uz.pdp.lesson.service;

import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.repository.MarketRepository;

import java.util.List;

public class CustomerService {
    private static CustomerService instance = new CustomerService();
    private MarketRepository marketRepository = new MarketRepository();

    private CustomerService() {}

    public static CustomerService getInstance() {
        return instance;
    }

    // Method to get all markets
    public List<Market> getAllMarkets() {
        return marketRepository.getAll();
    }

    // Method to add a market
    public void addMarket(Market market) {
        marketRepository.save(market);
    }

    // Method to get markets by owner ID
    public List<Market> getMarketsByOwnerId(int ownerId) {
        return marketRepository.getMarketsByOwnerId(ownerId);
    }
}
