import 'package:get/route_manager.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/feature/language/ar.dart';
import 'package:hummus_admin_panel/feature/language/en.dart';
import 'package:hummus_admin_panel/feature/language/he.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {
        eng: en,
        ara: ar,
        heb: he,
      };
}
