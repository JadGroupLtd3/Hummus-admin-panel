import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class RegionsController extends GetxController {
  late RegionsRepo regionsRepo;

  RegionsController(this.regionsRepo);
  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  RxList<RegionsData> regionsList = <RegionsData>[].obs;
  RxList<Regions> latLongRegions = <Regions>[].obs;

  TextEditingController regionsAddressName = TextEditingController();

  initState(){
    regionsAddressName.clear();
    latLongRegions.clear();
    status.value = false;
  }

  void isEdit(RegionsData regionsData){
    regionsAddressName.text = regionsData.name;
    for (var element in regionsData.regions) {
      latLongRegions.add(Regions(lat: element.lat, lng: element.lng));
    }
  }

  Future<void> createRegions(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    CreateRegionsModel regionsData = CreateRegionsModel(
      name: regionsAddressName.text,
      status: status.value == true ? 1 : 0,
      regions: latLongRegions,
    );
    final result = await regionsRepo.createRegions(
      regionsData: regionsData
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
     controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getRegions(context);
      regionsAddressName.clear();
      update();
    });
  }

  Future<void> updateRegions(BuildContext context,int regionId) async {
    controllerState.value = ControllerState.loading;
    RegionsData regionsData = RegionsData(
      id: regionId,
      name: regionsAddressName.text,
      status: status.value == true ? 1 : 0,
      regions: latLongRegions,
    );
    print(regionsData.toJson());
    final result = await regionsRepo.updateRegions(
      regionsData: regionsData,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getRegions(context);
      regionsAddressName.clear();
      Get.back();
      update();
    });
  }

  Future<void> getRegions(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await regionsRepo.getRegions();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      regionsList.value = right.data;
    });
  }

  Future<void> deleteRegions(BuildContext context,{required int regionsID}) async {
    controllerState.value = ControllerState.loading;
    final result = await regionsRepo.deleteRegions(regionsID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getRegions(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }
}