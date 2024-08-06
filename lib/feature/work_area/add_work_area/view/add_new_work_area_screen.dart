import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewWorkAreaScreen extends StatefulWidget {
  final bool isEdit;
  final RegionsData? regionsData;
  const AddNewWorkAreaScreen({super.key,this.isEdit = false,this.regionsData});

  @override
  State<AddNewWorkAreaScreen> createState() => _AddNewWorkAreaScreenState();
}

class _AddNewWorkAreaScreenState extends State<AddNewWorkAreaScreen> {
  final RegionsController regionsController = Get.find<RegionsController>();
  @override
  void initState() {
    regionsController.initState();
    if(widget.isEdit == true){
      regionsController.isEdit(widget.regionsData!);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.isEdit == true
                    ? '${'Home'.tr} / ${'Work Area'.tr} / ${'edit work area'.tr}'
                    : '${'Home'.tr} / ${'Work Area'.tr} / ${'Add New'.tr}',
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
                    height: MediaQuery.of(context).size.height * 1 / 2.8,
                    width: MediaQuery.of(context).size.height * 1 / 2.7,
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
                    child: const AddressTextField(),
                  ),
                  7.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    height: MediaQuery.of(context).size.height * 1 / 1.5,
                    width: MediaQuery.of(context).size.height * 1 / 1.1,
                    decoration: BoxDecoration(
                      color: MyThemeData.light.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 14,
                          spreadRadius: 9,
                        )
                      ],
                    ),
                    child: MapWidget(
                      isEdit: widget.regionsData != null,
                      regionsData: widget.regionsData,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
