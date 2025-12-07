import 'package:ak_weather_app/cubits/getWeather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherReturnViwe extends StatelessWidget {
  const WeatherReturnViwe({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;

    // ناخد أبعاد الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            weatherModel!.getColorTheme().shade500,
            weatherModel.getColorTheme().shade200,
            weatherModel.getColorTheme().shade100,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherModel.cityName,
                    style: TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: screenWidth * 0.1, // بدال 40
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'updated at ${weatherModel.updatedAt.split(" ")[1]}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.055, // بدال 22
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),

              Row(
                children: [
                  Transform.scale(
                    scale: MediaQuery.of(context).size.width * 0.0045,
                    child: Image.network(
                      "https:${weatherModel.image!}",
                      fit: BoxFit.contain,
                    ),
                  ),

                  Spacer(flex: 1),

                  Text(
                    weatherModel.avarageTemp.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Spacer(flex: 1),

                  Column(
                    children: [
                      Text(
                        'MinTemp: ${weatherModel.minTemp.round()}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'MaxTemp: ${weatherModel.maxTemp.round()}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),
              Text(
                weatherModel.weatherDescription,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.09,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
