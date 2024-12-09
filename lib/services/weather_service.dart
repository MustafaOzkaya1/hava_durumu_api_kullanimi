import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherService {
  Future<String> _getCityName() async {
    LocationPermission permission =
        await Geolocator.checkPermission(); //Konum izni kontrol et

    if (permission == LocationPermission.denied) {
      permission =
          await Geolocator.requestPermission(); //Konum izni yoksa izin iste
      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Konum izni verilmedi'); //Konum izni verilmediyse hata don
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
    final String? city = placemark[0].administrativeArea; //Sehir bilgisini al
    if (city == null) {
      throw Exception('Sehir bulunamadi'); //Sehir bilgisi yoksa hata don
    }
    return city; //Sehir bilgisini don
  }

  Future<void> getWeatherData() async {
    final String cityName = await _getCityName();
    final String url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=${cityName}';
    const Map<String, dynamic> headers = {
      'authorization':
          'authorization: apikey 4cmOw6fxVR9ZxWtZFMiUNQ:2bk6RcNfcGeRtYzeCYsE2o',
      'content-type': 'application/json',
    };

    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode != 200) {
      throw Exception('Hava durumu bilgisi getirilemedi');
    }

    print(response.data);
  }
}
