import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

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
                '${'Home'.tr} / ${'Users'.tr} / ${'Customers'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              // 12.verticalSpace,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     OnHover(
              //       builder: (isHovered) {
              //         return CustomButton(
              //           buttonText: 'Add New'.tr,
              //           backGroundColor: MyThemeData.light.focusColor,
              //           radius: 7,
              //           width: 150,
              //           height: 45,
              //           onPressed: (){
              //             Get.find<BottomNavBarController>().goToTab();
              //           },
              //         );
              //       },
              //     ),
              //     7.horizontalSpace,
              //   ],
              // ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      height: MediaQuery.of(context).size.height * 1 / 1.3,
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
                      child: const UsersTableWidget(
                        name: 'Customer name',
                        email: 'name@gmail.com',
                        phone: '0509876543',
                        kind: 'Customer',
                        imagePath: 'https://plus.unsplash.com/premium_photo-1720022609993-472f180738ed?q=80&w=2268&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
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
