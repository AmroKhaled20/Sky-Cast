import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final double minTemp;
  final double maxTemp;
  final String? image;
  final double avarageTemp;
  final String weatherDescription;
  final String updatedAt;

  WeatherModel({
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.image,
    required this.avarageTemp,
    required this.weatherDescription,
    required this.updatedAt,
  });



// 1) ليه factory؟ يعني إيه بالظبط؟
// factory ده نوع خاص من الكونستركتور (constructor) في دارت. الفرق الأساسي إن الـ factory:
// ممكن يعمل منطق قبل ما يرجّع الـ instance (يعني مش بس بيوزّن الحقول).
// يقدر يرجّع كائن موجود مسبقًا (caching / singleton) بدل ما يعمل واحد جديد.
// يقدر يرجّع subtype أو حتى null (لو مسموح) — لكن في حالتنا هو بيرجع WeatherModel.
// بنستخدم factory غالبًا عشان ننشئ object من مصدر خارجي زي JSON لأن بنحتاج parse/تحويل أو معالجة قبل الإنشاء.

// --------------------------------------------------------------------------------------------------------------------

// 2) ليه fromJson(json) بالذات؟
// ده pattern شائع: بنعمل factory اسمها fromJson علشان تبقى مسؤولة عن تحويل خريطة الـ JSON (اللي جت من الـ API) لكائن من نوع WeatherModel.


    factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      image: json['current']['condition']['icon'],
      avarageTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherDescription: json['current']['condition']['text'],
      updatedAt: json['current']['last_updated'],
    );
  }

  MaterialColor getColorTheme() {
    switch (weatherDescription) {
      case "Sunny":
      case "Clear":
        return Colors.orange;
      case "Partly cloudy":
      case "Cloudy":
      case "Overcast":
        return Colors.blueGrey;
      case "Mist":
      case "Fog":
      case "Freezing fog":
        return Colors.grey;
      case "Patchy rain possible":
      case "Patchy light drizzle":
      case "Light drizzle":
      case "Patchy light rain":
      case "Light rain":
      case "Light rain shower":
        return Colors.lightBlue;
      case "Moderate rain at times":
      case "Moderate rain":
      case "Heavy rain at times":
      case "Heavy rain":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
        return Colors.indigo;
      case "Patchy snow possible":
      case "Light snow":
      case "Patchy light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
      case "Patchy heavy snow":
      case "Heavy snow":
      case "Light snow showers":
      case "Moderate or heavy snow showers":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
      case "Blowing snow":
      case "Blizzard":
        return Colors.lightBlue;
      case "Patchy sleet possible":
      case "Light sleet":
      case "Moderate or heavy sleet":
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
        return Colors.blue;
      case "Patchy freezing drizzle possible":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
        return Colors.cyan;
      case "Ice pellets":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.lightGreen;
      case "Thundery outbreaks possible":
        return Colors.deepPurple;
      default:
        return Colors.teal;
    }
  }
}
