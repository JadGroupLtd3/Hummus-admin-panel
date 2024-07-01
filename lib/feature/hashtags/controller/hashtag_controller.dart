import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/snack_bar.dart';
import 'package:hummus_admin_panel/feature/hashtags/model/hashtag_model.dart';
import 'package:hummus_admin_panel/feature/hashtags/repo/hashtag_repo.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:image_picker/image_picker.dart';

class HashtagController extends GetxController {
  late HashtagRepo hashtagRepo;

  HashtagController(this.hashtagRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;

  TextEditingController hashtagNameAr = TextEditingController();
  TextEditingController hashtagNameEn = TextEditingController();
  TextEditingController hashtagNameHe = TextEditingController();

  HashtagModel? hashtagModel;
  RxList<Hashtag> hashtagList = <Hashtag>[].obs;

  Future<void> createComponent(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Hashtag hashtag = Hashtag(
      nameAr: hashtagNameAr.text,
      nameEn: hashtagNameEn.text,
      nameHe: hashtagNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    update();
    Response? response = await hashtagRepo.createHashtag(
      hashtagModel: hashtag,
      webImage: webImage,
    );
    print(response?.statusCode);
    print(response?.body);
    if (response?.statusCode == 200) {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(
          context: context,
          message: response?.body['message'],
          color: Colors.green);
      getHashtag(context);
      hashtagNameAr.clear();
      hashtagNameEn.clear();
      hashtagNameHe.clear();
      pickedProfileImageFile = null;
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(
          context: context,
          message: response?.body['message'],
          color: Colors.red);
    }
    update();
  }

  Future<void> getHashtag(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Response response = await hashtagRepo.getHashtag();
    if (response.statusCode == 200) {
      controllerState.value = ControllerState.success;
      hashtagModel = HashtagModel.fromJson(response.body);
      hashtagList.value = hashtagModel!.data;
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: response.body['message'], color: Colors.red);
    }
    update();
  }
}
