import 'package:flutter/material.dart';
import 'screens/ana_sayfa.dart';
import 'screens/detay_sayfasi.dart';
import 'screens/sepet_sayfasi.dart';

void main() {
  runApp(const MiniKatalogUygulamasi());
}

class MiniKatalogUygulamasi extends StatelessWidget {
  const MiniKatalogUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kahve Kataloğu',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AnaSayfa(),
        '/detay': (context) => const DetaySayfasi(),
        '/sepet': (context) => const SepetSayfasi(),
      },
    );
  }
}