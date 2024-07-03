import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? icon;
  final String? iconPng;
  final double? padding;
  final String? title;
  final String? description;
  final Function()? onYesPressed;
  final bool? isLogOut;
  final Function? onNoPressed;
  final Widget? widget;
  final double? width;
  final Color? color;
  final Color? backgroundColor;

  const ConfirmationDialog(
      {super.key,
      this.icon,
      this.color,
      this.backgroundColor,
      this.iconPng,
      this.padding,
      this.title,
      this.width,
      this.description,
      @required this.onYesPressed,
      this.isLogOut = false,
      this.onNoPressed,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width: width ?? 500,
        child: Padding(
          padding: EdgeInsets.all(padding ?? 20),
          child: widget ??
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      icon ?? '',
                      width: 50,
                      height: 50,
                      color: color,
                    ),
                  ),
                  title != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: TajawalRegular.copyWith(
                              fontSize: 17,
                              color: Colors.red,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      description ?? '',
                      style: TajawalRegular.copyWith(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: isLogOut! ? 'yes'.tr : 'no'.tr,
                          style: TajawalBold.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          backGroundColor: isLogOut!
                              ? MyThemeData.light.primaryColor
                              : const Color(0xffC1C1C1),
                          onPressed: () => isLogOut!
                              ? onYesPressed!()
                              : onNoPressed != null
                                  ? onNoPressed!()
                                  : Get.back(),
                          radius: 500,
                          height: 40,
                          width: 89,
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          buttonText: isLogOut! ? 'no'.tr : 'yes'.tr,
                          style: TajawalBold.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          backGroundColor: isLogOut!
                              ? const Color(0xffC1C1C1)
                              : MyThemeData.light.primaryColor,
                          onPressed: () => isLogOut! ? Get.back() : onYesPressed!(),
                          radius: 500,
                          height: 40,
                          width: 89,
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
