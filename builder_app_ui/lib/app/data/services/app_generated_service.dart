import 'package:builder_app_ui/app/data/models/app_generate.dart';

class AppGeneratedService {
  Future<List<AppGenerate>> getAppGeneratedValues() async {
    await Future.delayed(Duration(seconds: 2));

    return List.generate(
      5,
      (index) {
        final title = index.isEven ? 'Fintech Website' : 'E-commerce Website';
        final typePayment = index.isEven ? 'Free' : 'Payment';
        final publishad = index.isEven ? true : false;
        final typeApp = index.isEven ? 'APP' : 'WEB';

        return AppGenerate(
          title: title,
          typePayment: typePayment,
          publishad: publishad,
          typeApp: typeApp,
        );
      },
    );
  }
}
