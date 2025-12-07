import 'package:ak_weather_app/cubits/getWeather_cubit/getWeather_cubit_states.dart';
import 'package:ak_weather_app/models/weather_model.dart';
import 'package:ak_weather_app/services/weather_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// 2️⃣ create cubit (إنشاء الكيوبت)
// هنا بنكتب الكلاس اللي بيورّث من Cubit<State>.
// جوه الكيوبت هنكتب المنطق بتاعنا: إزاي نجيب البيانات، نخزنها، نغيّر الحالة.
// مثال: GetWeatherCubit extends Cubit<WeatherState>
// ليه مهم؟ هو العقل المدبر اللي بيربط بين الداتا (API / Database) وبين الـ UI.

class GetWeatherCubit extends Cubit<GeneralWeatherState> {
  GetWeatherCubit() : super(NoWeatherCubitState());
  WeatherModel? weatherModel;
  //   3️⃣ create function (إنشاء الدوال)
  // هنا بتكتب الـ Functions اللي هتعمل الأوامر.
  // مثلاً دالة اسمها getWeather(cityName)، جوهها:
  // تعمل emit لـ Loading.
  // تجيب البيانات من الـ API.
  // لو نجحت تعمل emit لـ Success ومعاها البيانات.
  // لو فشلت تعمل emit لـ Failure.
  // ليه مهم؟ الكيوبت مش هيشتغل من نفسه، لازم نديله أوامر وظيفية (Functions) علشان يغيّر الحالة.
  getWeatherByCubit({required String value}) async {
    try {
      weatherModel = await WeatherServices(Dio()).getWeather(cityName: value);
      emit(WeatherLoadedSuccessfulCubitState());
    } catch (e) {
      emit(WeatherFailureCubitState());
    }
  }
}



// ✅ الخلاصة:

// States = السيناريوهات المحتملة.

// Cubit = العقل اللي بيدير الموضوع.

// Functions = الأوامر اللي بيعملها العقل.

// Provide = أخلي العقل متاح للواجهة.

// Integrate = أربط الواجهة بالحالات.

// Trigger = أشغّل الأوامر.