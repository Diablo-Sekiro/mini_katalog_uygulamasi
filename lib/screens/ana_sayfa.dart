import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/urun.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Urun> urunler = [];

  @override
  void initState() {
    super.initState();
    jsonOku();
  }

  // Asset içerisindeki JSON'ı okuma
  Future<void> jsonOku() async {
    final String response = await rootBundle.loadString('assets/urunler.json');
    final data = await json.decode(response) as List;
    setState(() {
      urunler = data.map((i) => Urun.fromJson(i)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Coffee Shop Catalog'),
  backgroundColor: Colors.brown[700],
  foregroundColor: Colors.white,
  actions: [
    IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        Navigator.pushNamed(context, '/sepet');
      },
    ),
  ],
),
      body: urunler.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                final urun = urunler[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator + Route Arguments Kullanımı
                    Navigator.pushNamed(
                      context,
                      '/detay',
                      arguments: urun,
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.network(
                              urun.gorsel,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                urun.ad,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    urun.fiyat,
                                    style: TextStyle(color: Colors.brown[600], fontWeight: FontWeight.bold),
                                  ),
                                  // State Güncelleme Örneği (Favori Ekle/Çıkar)
                                  IconButton(
                                    icon: Icon(
                                      urun.isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: urun.isFavorite ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        urun.isFavorite = !urun.isFavorite;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}