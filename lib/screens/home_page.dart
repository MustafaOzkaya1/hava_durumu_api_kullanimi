import 'package:flutter/material.dart';
import 'package:hava_durumu_api_kullanimi/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    super.initState();
    WeatherService().getLocation().then((value) => print(value));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Dun bizi uzduler aga powerbank aldik ama '),
          ],
        ),
      ),
    );
  }
}
