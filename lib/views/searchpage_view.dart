import 'package:ak_weather_app/cubits/getWeather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchpageView extends StatelessWidget {
  const SearchpageView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 15,
          shadowColor: Colors.black.withOpacity(0.5),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                'Search for city',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              // 6️⃣ trigger cubit (تشغيل الكيوبت/استدعاء الدوال)
              // هنا بقى بنادي على الدوال اللي جوه الكيوبت.
              //  لما المستخدم يكتب مدينة ويدوس Search:
              // ليه مهم؟ علشان ده اللي بيشغّل الكيوبت ويغير الحالة، ولو ما عملتش كده الكيوبت هيبقى واقف مكانه.
              onSubmitted: (value) async {
                var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
                getweathercubit.getWeatherByCubit(value: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    // color: const Color.fromARGB(255, 39, 158, 255),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                hintText: 'Enter city name',
                labelText: 'Search',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
