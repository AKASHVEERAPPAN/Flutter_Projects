import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(weatherApp());
}

class weatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _weatherAppState createState() => _weatherAppState();
}

class _weatherAppState extends State<WeatherApp> {
  DecorationImage _buildWeatherImage() {
    String imagePath = '';

    if (temperature > 30) {
      imagePath = 'images/2.jpg';
    } else if (temperature < 22) {
      imagePath = 'images/3.jpg';
    } else {
      imagePath = 'images/1.jpg';
    }

    return DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
      opacity: 0.7,
    );
  }

  String apiKey = '9a7cf1644da0b43d16b0f30b7a5f1b15';
  String city = 'Chennai';
  late String apiUrl;
  double temperature = 0.0;
  String weatherDescription = '';
  double humidity = 0.0;
  double windSpeed = 0.0;
  double windDeg = 0.0;

  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        temperature = data['main']['temp'];
        weatherDescription = data['weather'][0]['description'];
        humidity = data['main']['humidity'].toDouble();
        windSpeed = data['wind']['speed'].toDouble();
        windDeg = data['main']['pressure'].toDouble();
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void updateWeather() {
    setState(() {
      city = cityController.text;
      apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    });
    fetchWeather();
  }

  Widget new_location() {
    return TextField(
      controller: cityController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 2)),
        hintText: 'Enter City Name',
        hintStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: const TextStyle(color: Colors.white),
      onSubmitted: (_) => updateWeather(),
    );
  }

  var search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchWeather,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: _buildWeatherImage(),
            //Image function
          ),
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            search = new_location();
                          });
                        },
                        icon: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: 25,
                            ),
                            Text(
                              'Click to Explore',
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                child: search,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      city,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // gradient: const  RadialGradient(
                        //   colors: [Color(0xFF90CAF9), Color(0xFF42A5F5),],
                        //   center: Alignment.center,
                        //   radius: 0.8,
                        // ),
                        color: Colors.blueGrey
                            .withOpacity(0.5), // Set opacity here
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          'Weather: $weatherDescription',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey
                            .withOpacity(0.5), // Set opacity here
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          'Humidity: ${humidity.toStringAsFixed(1)}%',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey
                            .withOpacity(0.5), // Set opacity here
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          'Wind Range: ${windSpeed.toStringAsFixed(1)} m/s',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey
                            .withOpacity(0.5), // Set opacity here
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          'Pressure: ${windDeg.toStringAsFixed(1)} hPa',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
