import 'package:simply_weather/screens/location_screen.dart';
import 'package:simply_weather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            locationWeather: weatherData,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
