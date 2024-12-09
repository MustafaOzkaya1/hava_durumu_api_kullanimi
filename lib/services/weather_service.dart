import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  Future<String> getLocation() async {
    // Kullanicidan Konumu al
    // Kullanicinin konumu acik mi kontrol ettik
    final bool servideEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servideEnabled) {
      Future.error(
          'Konum Servisiniz Kapali'); //Konum servisi kapaliysa hata don
    }

    //konum izni vermis mi kontrol ettik

    LocationPermission permisson =
        await Geolocator.checkPermission(); //Konum izni kontrol et

    if (permisson == LocationPermission.denied) {
      permisson =
          await Geolocator.requestPermission(); //Konum izni yoksa izin iste
      if (permisson == LocationPermission.deniedForever) {
        Future.error('Konum izni verilmedi'); //Konum izni verilmediyse hata don
      }
    }

    //Kullanicin pozisyonunu aldik
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy
            .high); //Konumu al position al locationAcuuary ile konum hassasiyeti belirle
    //kullanicinin pozisyonundan yerlesim noktasini bulduk
    final List<Placemark> placemark = await placemarkFromCoordinates(
        position.latitude, position.longitude); //Konum bilgilerini al
    //sehrimizin yerlesim noktasini kaydettik ve dondurduk
    final String? city = placemark[0].locality; //Sehir bilgisini al
    if (city == null)
      Future.error('Sehir bulunamadi'); //Sehir bilgisi yoksa hata don
    return city!; //Sehir bilgisini don
  }
}
