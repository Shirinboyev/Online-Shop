package uz.pdp.lesson.model.vertification;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data

public class Vertification {
    private Integer id;
    private String send_code;
    private Integer user_id;
}
