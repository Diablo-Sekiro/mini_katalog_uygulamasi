import 'package:flutter/material.dart';
import '../models/urun.dart';

class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({super.key});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  // Toplam fiyatı hesaplayan yardımcı fonksiyon
  double get toplamFiyat {
    double toplam = 0;
    for (var item in sepetListesi) {
      // "90 TL" string metninden sadece sayısal kısmı alıp topluyoruz
      String fiyatTemiz = item.fiyat.replaceAll(RegExp(r'[^0-9.]'), '');
      toplam += double.tryParse(fiyatTemiz) ?? 0;
    }
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: sepetListesi.isEmpty
            ? const Center(
                child: Text(
                  'Sepetinizde ürün bulunmamaktadır. ☕',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: sepetListesi.length,
                      itemBuilder: (context, index) {
                        final urun = sepetListesi[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const Icon(Icons.coffee, color: Colors.brown),
                            title: Text(urun.ad),
                            subtitle: Text(urun.kategori),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  urun.fiyat,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      sepetListesi.removeAt(index); // Sepetten çıkarma
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Toplam:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${toplamFiyat.toStringAsFixed(0)} TL',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        if (sepetListesi.isNotEmpty) {
                          setState(() {
                            sepetListesi.clear(); // Sipariş tamamlanınca sepeti temizle
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Siparişiniz alındı! ☕')),
                          );
                        }
                      },
                      child: const Text('Siparişi Tamamla', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}