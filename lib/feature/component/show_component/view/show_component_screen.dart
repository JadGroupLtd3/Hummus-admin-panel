import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/component/show_component/widget/component_table_widget.dart';
import 'package:get/get.dart';


class ShowComponentScreen extends StatelessWidget {
  const ShowComponentScreen({super.key});

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
                '${'Home'.tr} / ${'Component'.tr} / ${'Show component'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OnHover(
                    builder: (isHovered) {
                      return CustomButton(
                        buttonText: 'Add New'.tr,
                        backGroundColor: const Color(0xff36D000),
                        radius: 7,
                        width: 150,
                        height: 45,
                        onPressed: (){
                          Get.find<SliderPagesController>().goToTab(21);
                        },
                      );
                    },
                  ),
                  7.horizontalSpace,
                ],
              ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      height: MediaQuery.of(context).size.height * 1 / 1.43,
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
                      child: const ComponentTableWidget(),
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
