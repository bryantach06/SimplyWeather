import 'package:flutter/material.dart';
import 'package:simply_weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        title: Text('Get City Weather', style: kMessageTextStyle,),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: kTextFieldInputDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
