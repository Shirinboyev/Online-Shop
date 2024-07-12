package uz.pdp.lesson.imageEncoder;
import java.util.Base64;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;

public class ImageEncoder {
    public static String encodeImage(String imagePath) throws IOException {
        byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
        return Base64.getEncoder().encodeToString(imageBytes);
    }
}
