package backend.service;

import backend.model.market.Market;
import backend.model.products.Products;
import backend.repository.ProductsRepository;
import backend.repository.MarketRepository;

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
    public void deleteMarket(int marketId) {
        productsRepository.deleteProductsByMarketId(marketId);
        marketRepository.deleteMarketById(marketId);
    }
}
