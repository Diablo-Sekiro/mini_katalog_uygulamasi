class Urun {
  final int id;
  final String ad;
  final String fiyat;
  final String kategori;
  final String gorsel;
  final String aciklama;
  bool isFavorite;

  Urun({
    required this.id,
    required this.ad,
    required this.fiyat,
    required this.kategori,
    required this.gorsel,
    required this.aciklama,
    this.isFavorite = false,
  });

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      id: json['id'],
      ad: json['ad'],
      fiyat: json['fiyat'],
      kategori: json['kategori'],
      gorsel: json['gorsel'],
      aciklama: json['aciklama'],
    );
    
  }
}
List<Urun> sepetListesi = [];