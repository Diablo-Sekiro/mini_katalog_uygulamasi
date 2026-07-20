import 'package:flutter/material.dart';
import '../models/urun.dart';

class DetaySayfasi extends StatelessWidget {
  const DetaySayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    // Route Arguments ile gönderilen Urun nesnesini alıyoruz
    final urun = ModalRoute.of(context)!.settings.arguments as Urun;

    return Scaffold(
      appBar: AppBar(
        title: Text(urun.ad),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              urun.gorsel,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(urun.kategori),
                        backgroundColor: Colors.brown[100],
                      ),
                      Text(
                        urun.fiyat,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    urun.ad,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    urun.aciklama,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.4),
                  ),
                  const SizedBox(height: 30),

                  // SEPETE EKLE BUTONU VE STATE SIMÜLASYONU
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
  // Ürünü ortak sepete ekliyoruz
  sepetListesi.add(urun);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${urun.ad} sepete eklendi! ☕'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.brown[800],
    ),
  );
},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(
                        'Sepete Ekle',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}