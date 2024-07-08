import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class AddressTextField extends StatefulWidget {
  const AddressTextField({super.key});

  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegionsController>(
      builder: (regionsController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: MyThemeData.light.focusColor,
                  ).paddingSymmetric(horizontal: 7),
                  Text(
                    'Address'.tr,
                    style: TajawalRegular.copyWith(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              CustomTextField(
                height: 45,
                radius: 20,
                hintText: 'Address'.tr,
                inputType: TextInputType.text,
                controller: regionsController.regionsAddressName,
              ),
              30.verticalSpace,
              Text(
                'Activation status'.tr,
                style: TajawalRegular.copyWith(
                  fontSize: 15,
                ),
              ),
              20.verticalSpace,
              CustomSwitch(
                value: regionsController.status.value,
                onChanged: (val) {
                  val == true
                      ? regionsController.status.value = true
                      : regionsController.status.value = false;
                },
              ).paddingSymmetric(horizontal: 10),
            ],
          ),
        );
      },
    );
  }
}
