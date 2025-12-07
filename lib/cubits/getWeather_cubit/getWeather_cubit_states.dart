class GeneralWeatherState{}

class NoWeatherCubitState extends GeneralWeatherState{}
class WeatherLoadedSuccessfulCubitState extends GeneralWeatherState{}
class WeatherFailureCubitState extends GeneralWeatherState{}


// 1️⃣ create states (إنشاء الحالات)

// أي Cubit أو Bloc لازم يبقى عنده حالات مختلفة علشان يعرف يقول للواجهة (UI) أنا دلوقتي في حالة إيه.

// مثلاً في تطبيق الطقس:

// Loading: لما لسه بجمع البيانات من الـ API.

// Success: لما البيانات رجعت بنجاح.

// Failure: لما حصل Error.

// ليه مهم؟ علشان الواجهة متفضلش ثابتة، تبقى فاهمة Cubit بيعمل إيه وتتصرف (تظهر لودينج، تعرض بيانات، تعرض Error).