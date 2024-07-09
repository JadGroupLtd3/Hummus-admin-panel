import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewTable extends StatefulWidget {
  final bool isEdit;
  final TablesData? table;
  const AddNewTable({super.key,this.isEdit = false,this.table});

  @override
  State<AddNewTable> createState() => _AddNewTableState();
}

class _AddNewTableState extends State<AddNewTable> {
  final GlobalKey<FormState> tableKey = GlobalKey<FormState>();
  final TablesController tablesController = Get.find<TablesController>();
  @override
  void initState() {
    tablesController.initState();
    if(widget.isEdit == true) {
      tablesController.isEdit(widget.table!);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<TablesController>(
            builder: (tablesController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Tables'.tr} / ${'Edit'.tr}'
                        : '${'Home'.tr} / ${'Tables'.tr} / ${'Add New'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        height: MediaQuery.of(context).size.height * 1 / 2.0,
                        width: MediaQuery.of(context).size.height * 1 / 1.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 14,
                              spreadRadius: 9,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Form(
                                  key: tableKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      20.verticalSpace,
                                      Text(
                                        'Table Number'.tr,
                                        style: TajawalRegular.copyWith(
                                          fontSize: 14,
                                        ),
                                      ).paddingSymmetric(horizontal: 10),
                                      10.verticalSpace,
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 0),
                                              color:
                                                  Colors.black.withOpacity(0.22),
                                              blurRadius: 8,
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: CustomTextField(
                                          hintText: 'Table Number'.tr,
                                          height: 45,
                                          radius: 15,
                                          inputType: TextInputType.text,
                                          controller: tablesController.tablesNumber,
                                        ),
                                      ),
                                      30.verticalSpace,
                                      CustomSwitch(
                                        value: tablesController.status.value,
                                        onChanged: (val) {
                                          val == true
                                              ? tablesController.status.value = true
                                              : tablesController.status.value = false;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(() {
                                switch (tablesController.controllerState.value) {
                                  case ControllerState.loading:
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children:
                                      [
                                        CircularProgressIndicator(
                                          color: MyThemeData.light.primaryColor,
                                        ),
                                        12.horizontalSpace,
                                      ],
                                    );
                                  case ControllerState.error:
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomButton(
                                          buttonText: widget.isEdit == true
                                              ? 'edit'.tr
                                              : 'save'.tr,
                                          icon: SvgPicture.asset(Images.correct)
                                              .paddingSymmetric(horizontal: 4),
                                          style: TajawalBold.copyWith(
                                            color: Colors.white,
                                          ),
                                          radius: 20,
                                          width: 160,
                                          height: 45,
                                          backGroundColor:
                                          MyThemeData.light.primaryColor,
                                          onPressed: () {
                                            if(tableKey.currentState!.validate()){
                                              if(widget.isEdit == true){
                                                tablesController.updateTables(
                                                  context,
                                                  widget.table?.id,
                                                );
                                              }else {
                                                tablesController.createTables(context);
                                              }
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  default:
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomButton(
                                          buttonText: widget.isEdit == true
                                              ? 'edit'.tr
                                              : 'save'.tr,
                                          icon: SvgPicture.asset(Images.correct)
                                              .paddingSymmetric(horizontal: 4),
                                          style: TajawalBold.copyWith(
                                            color: Colors.white,
                                          ),
                                          radius: 20,
                                          width: 160,
                                          height: 45,
                                          backGroundColor:
                                          MyThemeData.light.primaryColor,
                                          onPressed: () {
                                            if(tableKey.currentState!.validate()){
                                              if(widget.isEdit == true){
                                                tablesController.updateTables(
                                                  context,
                                                  widget.table?.id,
                                                );
                                              }else {
                                                tablesController.createTables(context);
                                              }
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
