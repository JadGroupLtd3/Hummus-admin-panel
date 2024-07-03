import 'dart:typed_data';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get.dart';

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

  RxList<Hashtag> hashtagList = <Hashtag>[].obs;

  Future<void> createHashtag(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Hashtag hashtag = Hashtag(
      nameAr: hashtagNameAr.text,
      nameEn: hashtagNameEn.text,
      nameHe: hashtagNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await hashtagRepo.createHashtag(
      hashtagModel: hashtag,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getHashtag(context);
      hashtagNameAr.clear();
      hashtagNameEn.clear();
      hashtagNameHe.clear();
      pickedProfileImageFile = null;
      update();
    });
  }

  Future<void> getHashtag(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await hashtagRepo.getHashtag();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      hashtagList.value = right.data;
    });
  }

  Future<void> deleteHashtag(BuildContext context,{required int hashtagID}) async {
    controllerState.value = ControllerState.loading;
    final result = await hashtagRepo.deleteHashtag(hashtagID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getHashtag(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

}
