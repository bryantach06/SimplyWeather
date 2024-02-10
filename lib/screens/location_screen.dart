import 'package:simply_weather/screens/city_screen.dart';
import 'package:simply_weather/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:simply_weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  var temp;
  var weatherIcon;
  var cityName;
  var message;

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temp = 0;
      weatherIcon = 'Error';
      message = 'Unable to get weather data';
      cityName = '';
      return;
    }
    setState(() {
      temp = weatherData['main']['temp'];
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];

      weatherIcon = weatherModel.getWeatherIcon(condition);
      message = weatherModel.getMessage(temp.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData =
                        await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CityScreen(),
                          ),
                        );
                        if (typedName != null) {
                          var weatherData = await weatherModel.getCityWeather(
                              typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: const Icon(
                        Icons.search,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '${temp.toInt()}°', //response is double
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
                Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
