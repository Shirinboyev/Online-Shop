package uz.pdp.lesson.enums;

public enum Categories {

    ELEKTRONIKA("Elektronika", "Telefonlar, noutbuklar va boshqa qurilmalar."),
    MODA("Moda", "Kiyim-kechaklar, aksessuarlar va boshqalar."),
    KITOBLAR("Kitoblar", "Har xil kitoblar."),
    OZIQ_OVQATLAR("Oziq-ovqatlar", "Kunlik ehtiyojlar va oziq-ovqat mahsulotlari"),
    MAISHIY_TEXNIKA("Maishiy texnika", "Uy-ro'zg'or jihozlari va uskunalari"),
    GOZALLIK("Go'zallik", "Go'zallik va shaxsiy parvarish mahsulotlari"),
    OYINCHOQLAR("O'yinchoqlar", "Bolalar uchun o'yinchoqlar va o'yinlar"),
    SPORT("Sport", "Sport jihozlari va kiyimlari"),
    AVTOMOBIL("Avtomobil", "Avtomobil aksessuarlari va ehtiyot qismlari"),
    SALOMATLIK("Salomatlik", "Sog'liqni saqlash mahsulotlari va qo'shimchalar"),
    ZARGARLIK("Zargarlik", "Zargarlik buyumlari va soatlar"),
    MEBEL("Mebel", "Uy va ofis uchun mebellar"),
    MUSIQA("Musiqa", "Musiqa asboblari va aksessuarlari"),
    HAYVONLAR_UCHUN_MAHSULOTLAR("Hayvonlar uchun mahsulotlar", "Uy hayvonlari uchun mahsulotlar"),
    SANAT("San'at", "San'at buyumlari va rassomlik materiallari"),
    OFIS_TAMINOTLARI("Ofis ta'minotlari", "Kantselyariya va ofis jihozlari"),
    BOGDORCHILIK("Bog'dorchilik", "Bog'dorchilik asboblari va o'simliklar"),
    BOLALAR_UCHUN_MAHSULOTLAR("Bolalar uchun mahsulotlar", "Bolalar va go'daklar uchun mahsulotlar"),
    POYABZAL("Poyabzal", "Oyoq kiyimlari va sandallar"),
    TASHQI_MUHOFAZA("Tashqi muhofaza", "Ochiq havoda foydalaniladigan jihozlar va uskunalar"),
    SAYOHAT("Sayohat", "Sayohat aksessuarlari va yukxaltalar"),
    UY_BEZAKLARI("Uy bezaklari", "Uy uchun bezak buyumlari"),
    QOL_ISHLARI("Qo'l ishlari", "Qo'l bilan ishlash uchun asboblar va to'plamlar"),
    OYIN_KULGULI_MAHSULOTLAR("O'yin-kulguli mahsulotlar", "Filmlar, o'yinlar va boshqa ko'ngilochar mahsulotlar"),
    DASTURIY_TAMINOT("Dasturiy ta'minot", "Dasturiy mahsulotlar va ilovalar"),
    OSH_PAZANDALIK("Oshpazlik", "Oshxona jihozlari va idish-tovoqlar");

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
