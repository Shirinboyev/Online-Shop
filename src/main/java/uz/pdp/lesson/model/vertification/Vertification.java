package uz.pdp.lesson.model.vertification;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Vertification {
    private Integer id;
    private String send_code;
    private Integer user_id;
}
