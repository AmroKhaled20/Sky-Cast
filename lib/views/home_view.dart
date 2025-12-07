import 'package:ak_weather_app/Widgets/noweatherapp_widgets.dart';
import 'package:ak_weather_app/Widgets/weatherreturn_widgets.dart';
import 'package:ak_weather_app/cubits/getWeather_cubit/getWeather_cubit_states.dart';
import 'package:ak_weather_app/cubits/getWeather_cubit/get_weather_cubit.dart';
import 'package:ak_weather_app/views/searchpage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          shadowColor: Colors.black.withOpacity(0.6),

          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Weather App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 5),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchpageView(),
                  ),
                );
              },
              icon: const Icon(Icons.search, color: Colors.white, size: 32),
            ),
          ],
        ),

// 5️⃣ integrate cubit (دمج الكيوبت مع الواجهة)
// بنستخدم BlocBuilder أو BlocConsumer علشان نخلي الـ UI يتفاعل مع الحالات.
// ليه مهم؟ من غير الدمج، الكيوبت هيشتغل بس الواجهة مش هتعرف تتغير.

        body: BlocBuilder<GetWeatherCubit, GeneralWeatherState>(
          builder: (context, state) {
            if (state is NoWeatherCubitState) {
              return NoweatherappView();
            } else if (state is WeatherLoadedSuccessfulCubitState) {
              return WeatherReturnViwe();
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'oops there was an error, try again later',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            MediaQuery.of(context).size.width < 400 ? 16 : 20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
