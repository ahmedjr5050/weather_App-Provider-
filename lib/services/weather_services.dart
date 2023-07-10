import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServies {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apiKey = 'e1cecef5a4ce4de6832202427230207&q';

  Future<WeatherModel?> getweather({required String cityName}) async {
      WeatherModel? weatherDate;
    try {
      Uri url =
          Uri.parse('$baseurl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherDate = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherDate;
  }
}
