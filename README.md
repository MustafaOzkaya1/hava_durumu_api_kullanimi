# Flutter ile Hava Durumu API Uygulaması  

Bu proje, Flutter ile hava durumu bilgilerini API üzerinden çekerek kullanıcıya sunan basit bir uygulamadır. Uygulama, kullanıcının bulunduğu konumu alır ve bu konuma ait hava durumu bilgisini API isteği yaparak görüntüler.

![Ekran görüntüsü](https://github.com/MustafaOzkaya1/hava_durumu_api_kullanimi/blob/main/assets/ss.jpg?raw=true)[100]

---

## Kullanılan Paketler  

### 1. **Dio** (`dio: ^5.0.0`)  
- **Amacı:** HTTP isteklerini kolayca yapmak için kullanılır.  
- **Kodda Kullanımı:**  
  - API’ye `GET` isteği yapmak için kullanıldı.  
  - Başlık bilgileri ve URL parametrelerini içeren HTTP isteği gerçekleştirildi.  

### 2. **Geolocator** (`geolocator: ^9.0.2`)  
- **Amacı:** Kullanıcının cihaz konumunu almak için kullanılır.  
- **Kodda Kullanımı:**  
  - Kullanıcının mevcut enlem ve boylam bilgilerini almak için kullanıldı.  
  - Konum izin kontrolü ve isteği gerçekleştirildi.  

### 3. **Geocoding** (`geocoding: ^2.0.0`)  
- **Amacı:** Enlem ve boylam bilgilerini kullanarak şehir adı gibi adres ayrıntılarını almak için kullanılır.  
- **Kodda Kullanımı:**  
  - Kullanıcının bulunduğu konumun `administrativeArea` değerini almak için kullanıldı.  

---

## Proje Yapısı  

### **1. Services/WeatherService**  
- **Görev:** API çağrısını yapmak ve gelen veriyi işlemek.  
- **Fonksiyonlar:**  
  - `_getCityName()`: Konum verilerini işleyerek şehir adını döndürür.  
  - `getWeatherData()`: API isteği yapar ve gelen verileri `WeatherModel` nesnelerine dönüştürerek liste olarak döndürür.  

### **2. Models/WeatherModel**  
- **Görev:** API’den alınan hava durumu verilerini nesneye dönüştürmek.  
- **Alanlar:** `gun`, `ikon`, `durum`, `derece`, `min`, `max`, `gece`, `nem`.  

### **3. HomePage Widget**  
- **Görev:** Verileri listeleme ve kullanıcı arayüzünü oluşturma.  
- **Bileşenler:**  
  - `ListView.builder`: Hava durumu kartlarını listelemek için kullanıldı.  
  - `Container`: Hava durumu bilgisini gösteren kartın tasarımını yapar.  

---

## Çalışma Akışı  
1. **Başlatma:** Uygulama başlatıldığında `HomePage` bileşeni yüklenir ve `initState` içinde `getWeatherData` çağrılır.  
2. **Konum ve Şehir Alma:** Kullanıcının konumu alınır ve şehir bilgisi API’ye iletilir.  
3. **API İsteği:** Hava durumu verileri çekilir ve işlenir.  
4. **Arayüz Güncelleme:** Gelen veriler ekranda gösterilir.  

