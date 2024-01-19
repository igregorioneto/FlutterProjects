import 'package:builder_app_ui/app/data/models/app_generate.dart';
import 'package:builder_app_ui/app/data/services/app_generated_service.dart';

class HomeViewModel {
  final _appGeneratedService = AppGeneratedService();

  Future<List<AppGenerate>> fetchAppGeneratedValues() async {
    return await _appGeneratedService.getAppGeneratedValues();
  }
}