package uz.pdp.lesson.service;

import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.repository.CustomerRepository;

import java.util.List;

public class CustomerService {
    private static CustomerService instance;
    private CustomerRepository customerRepository = new CustomerRepository();

    public String createMarket(String name, int ownerId) {
        Market market = new Market();
        market.setName(name);
        market.setOwnerId(ownerId);
        customerRepository.saveMarket(market);
        return "Market created successfully";
    }

    public static CustomerService getInstance() {
        if (instance == null) {
            synchronized (CustomerService.class) {
                if (instance == null) {
                    instance = new CustomerService();
                }
            }
        }
        return instance;
    }
    public List<Market> getAllMarkets() {
        return customerRepository.getAllMarkets();
    }

    public List<Market> getMarketsByUserId(int userId) {
        return customerRepository.getMarketsByUserId(userId);
    }
    public List<Market> getMarketsByOwnerId(int ownerId) {
        return customerRepository.findMarketsByOwnerId(ownerId);
    }
}
