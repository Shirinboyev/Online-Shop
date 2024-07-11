package uz.pdp.lesson.model.market;


import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder

public class Market {
    private int id;
    private String name;
    private int ownerId;

    public Market(int id, String name, int ownerId) {
        this.id = id;
        this.name = name;
        this.ownerId = ownerId;
    }
}
