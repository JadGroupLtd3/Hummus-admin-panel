import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class TablesController extends GetxController {
  late TablesRepo tablesRepo;

  TablesController(this.tablesRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;

  TextEditingController tablesNumber = TextEditingController();

  RxList<TablesData> tablesList = <TablesData>[].obs;

  initState(){
    tablesNumber.clear();
    status.value = false;
  }
  void isEdit(TablesData table){
    tablesNumber.text = table.number;
    status.value = table.status == 1 ? true : false;
  }

  Future<void> createTables(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    TablesData tablesData = TablesData(
      number: tablesNumber.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await tablesRepo.createTables(
      tablesData: tablesData
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getTables(context);
      initState();
      update();
    });
  }

  Future<void> updateTables(BuildContext context,int tableId) async {
    controllerState.value = ControllerState.loading;
    TablesData tablesData = TablesData(
      id: tableId,
      number: tablesNumber.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await tablesRepo.updateTables(
        tablesData: tablesData
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getTables(context);
      initState();
      Get.back();
      update();
    });
  }

  Future<void> getTables(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await tablesRepo.getTables();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      tablesList.value = right.data;
    });
  }

  Future<void> deleteTables(BuildContext context,{required int tablesID}) async {
    controllerState.value = ControllerState.loading;
    final result = await tablesRepo.deleteTables(tablesID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getTables(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }
}
