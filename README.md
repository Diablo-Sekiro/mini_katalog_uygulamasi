# Kahve Kataloğu Uygulaması (Mini Catalog App)

Bu proje, Flutter kullanılarak geliştirilmiş bir mini kahve kütüphanesi/katalog uygulamasıdır. Kullanıcıların kahve çeşitlerini listelemesine, detaylarını incelemesine, favorilere eklemesine ve sepete ekleyip yönetmesine olanak tanır.

---

## Özellikler

- **Yerel JSON Veri Yönetimi:** Ürün bilgileri ve görseller `assets/urunler.json` dosyasından dinamik olarak yüklenir.
- **Katalog Ekranı (GridView):** 2 sütunlu kart (Card) mimarisi ile temiz ürün listeleme.
- **Detay Sayfası & Route Arguments:** Tıklanan ürüne özel detay sayfası ve adlandırılmış rota (Named Route) ile veri aktarımı.
- **Dinamik Sepet Yönetimi:** Sepete ürün ekleme, sepetten ürün silme ve toplam tutar hesaplama.


---

## Kullanılan Teknolojiler ve Sürümler

- **Flutter SDK:** `>=3.0.0` (Dart SDK `>=3.0.0`)
- **IDE:** Visual Studio Code / Android Studio
- **Paketler:** 
  - `flutter/services.dart` (Asset JSON okuma işlemleri için)

---

## 🚀 Çalıştırma Adımları

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları sırasıyla uygulayabilirsiniz:

1. **Repository'yi Kllonlayın:**
   ```bash
   git clone https://github.com/Diablo-Sekiro/mini_katalog_uygulamasi


2. bu aşamaları terminal üzerinden yapabilirsiniz.

Proje Dizinine Gitin:

cd mini_katalog_uygulamasi

Bağımlılıkları Yükleyin:

flutter pub get

Uygulamayı Çalıştırın:
Bir emülatör veya fiziksel cihaz bağlıyken aşağıdaki komutu çalıştırın:

flutter run

3. Proje Klasör Yapısı

mini_katalog_uygulamasi/
│
├── assets/
│   └── urunler.json       # Ürün verileri
│
├── lib/
│   ├── models/
│   │   └── urun.dart      # Ürün modeli ve global sepet listesi
│   │
│   ├── screens/
│   │   ├── ana_sayfa.dart     # GridView, arama ve favori mantığı
│   │   ├── detay_sayfasi.dart # Ürün detay ve sepete ekleme
│   │   └── sepet_sayfasi.dart # Sepet listesi ve toplam hesaplama
│   │
│   └── main.dart          # Uygulama başlangıcı ve Route tanımları
│
└── README.md              # Proje dokümantasyonu
