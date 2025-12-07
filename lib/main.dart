import 'package:ak_weather_app/cubits/getWeather_cubit/getWeather_cubit_states.dart';
import 'package:ak_weather_app/cubits/getWeather_cubit/get_weather_cubit.dart';
import 'package:ak_weather_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
//     4️⃣ provide cubit (توفير الكيوبت للواجهة)
// هنا بنستخدم BlocProvider علشان نخلي الكيوبت متاح لأي Widget تحته.

    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GeneralWeatherState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<GetWeatherCubit>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch:
                  cubit.weatherModel == null
                      ? Colors.blue
                      : cubit.weatherModel!.getColorTheme(),
              appBarTheme: AppBarTheme(
                backgroundColor:
                    cubit.weatherModel == null
                        ? Colors.blue
                        : cubit.weatherModel!.getColorTheme(),
              ),
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
