package uz.pdp.lesson.service;

import uz.pdp.lesson.model.market.Market;
import uz.pdp.lesson.model.products.Products;
import uz.pdp.lesson.repository.MarketRepository;
import uz.pdp.lesson.repository.ProductsRepository;

import java.util.ArrayList;
import java.util.List;

public class MarketService  {
    private final List<Products> products;
    private static MarketService marketService;
    private static final ProductsRepository productsRepository = new ProductsRepository();
    private static final MarketRepository marketRepository = new MarketRepository();

    private MarketService() {
        this.products = new ArrayList<>();
    }
    public static MarketService getInstance() {
        if (marketService == null) {
            marketService = new MarketService();
        }
        return marketService;
    }

    public List<Integer> getMarketsIdByOwnerId(Integer ownerId) {
        List<Market> marketsByOwnerId = marketRepository.getMarketsByOwnerId(ownerId);
        List<Integer> marketsId = new ArrayList<>();
        for (Market market : marketsByOwnerId) {
            marketsId.add(market.getId());
        }
        return marketsId;
    }
}
