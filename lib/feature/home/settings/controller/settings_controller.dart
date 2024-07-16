import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/settings/model/settings_model.dart';

class SettingsController extends GetxController {
  late SettingsRepo settingsRepo;

  SettingsController(this.settingsRepo);

  var controllerState = ControllerState.idle.obs;

  RxInt drinkCatId = 0.obs;

  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  String? imagePath;

  TextEditingController deliveryPrice = TextEditingController();
  TextEditingController appName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController fax = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController tiktok = TextEditingController();
  TextEditingController google = TextEditingController();
  TextEditingController whatsapp = TextEditingController();

  Rx<SettingsData?> settings = Rx<SettingsData?>(null);

  initTextController() {
    pickedProfileImageFile = null;
    deliveryPrice.clear();
    appName.clear();
    phone.clear();
    email.clear();
    taxNumber.clear();
    address.clear();
    fax.clear();
    facebook.clear();
    twitter.clear();
    instagram.clear();
    tiktok.clear();
    google.clear();
    whatsapp.clear();
  }

  initSettings(SettingsData settings) {
    initTextController();
    deliveryPrice.text = settings.deliveryPrice;
    appName.text = settings.appName;
    phone.text = settings.phone;
    email.text = settings.email;
    taxNumber.text = settings.taxNumber;
    address.text = settings.address;
    fax.text = settings.fax;
    facebook.text = settings.facebook;
    twitter.text = settings.twitter;
    instagram.text = settings.instagram;
    tiktok.text = settings.tiktok;
    google.text = settings.google;
    whatsapp.text = settings.whatsapp;
    drinkCatId.value = settings.drinkCatId;
    imagePath = settings.logo;
  }

  Future<void> createSettings(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    SettingsData settingsData = SettingsData(
      deliveryPrice: deliveryPrice.text,
      appName: appName.text,
      phone: phone.text,
      email: email.text,
      taxNumber: taxNumber.text,
      address: address.text,
      fax: fax.text,
      facebook: facebook.text,
      twitter: twitter.text,
      instagram: instagram.text,
      tiktok: tiktok.text,
      google: google.text,
      whatsapp: whatsapp.text,
      drinkCatId: drinkCatId.value,
    );
    final result = await settingsRepo.createSettings(
      settingsData: settingsData,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getSettings(context);
      update();
    });
  }

  Future<void> getSettings(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await settingsRepo.getSettings();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      settings.value = right.data;
    });
  }
}
