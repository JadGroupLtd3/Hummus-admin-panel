import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';

class LanguageController extends GetxController {
  var switchValue = false;
  var storage = GetStorage();
  var langLocal = ara;

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage ?? 'ar';
  }

  /// Language

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String?> get getLanguage async {
    return storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }
    if (typeLang == eng) {
      langLocal = eng;
      saveLanguage(eng);
    } else if (typeLang == heb) {
      langLocal = heb;
      saveLanguage(heb);
    } else {
      langLocal = ara;
      saveLanguage(ara);
    }
    update();
  }
}
