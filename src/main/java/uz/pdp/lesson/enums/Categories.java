package uz.pdp.lesson.enums;

public enum Categories {

    Laptop("Laprop", "Telefonlar, noutbuklar va boshqa qurilmalar."),
    Phone("Phone", "Kiyim-kechaklar, aksessuarlar va boshqalar."),
    OziqOvqatlar("Kitoblar", "Har xil kitoblar."),
    Aksesuar("Aksesuarlar", "Kunlik ehtiyojlar va quloqchin va iwatchlar mahsulotlari");

    private final String displayName;
    private final String description;

    Categories(String displayName, String description) {
        this.displayName = displayName;
        this.description = description;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getDescription() {
        return description;
    }
}
