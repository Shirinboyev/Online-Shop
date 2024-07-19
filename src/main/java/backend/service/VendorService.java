package backend.service;

import backend.repository.UserRepository;
import backend.model.market.Market;
import backend.repository.MarketRepository;

import java.util.List;

public class VendorService {
    private static VendorService instance = new VendorService();
    private MarketRepository marketRepository = new MarketRepository();
    private UserRepository userRepository = new UserRepository();

    public VendorService() {}

    public static VendorService getInstance() {
        return instance;
    }

    // Method to get all markets
    public List<Market> getAllMarkets() {
        return marketRepository.getAll();
    }

    // Method to add a market
    public boolean addMarket(Market market) {
        marketRepository.save(market);
        return true;
    }

    // Method to get markets by owner ID
    public List<Market> getMarketsByOwnerId(int ownerId) {
        return marketRepository.getMarketsByOwnerId(ownerId);
    }


    public List<Market> getMarketsByUserId(int ownerId) {
        return marketRepository.getMarketsByOwnerId(ownerId);
    }

    public boolean deleteVendor(int id) {
        return userRepository.deleteVendor(id);
    }
}