import 'package:flutter/material.dart';
import 'package:hava_durumu_api_kullanimi/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? city;

  @override
  void initState() {
    WeatherService().getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (city != null)
              Text('Sehir: $city')
            else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
