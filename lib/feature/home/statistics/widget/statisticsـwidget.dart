import 'package:hummus_admin_panel/core/core_export.dart';

class StatisticsWidget extends StatelessWidget {
  final String quantity;
  final String title;
  final String imagePath;

  const StatisticsWidget({
    super.key,
    required this.quantity,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.10),
          ),
        ),
        child: ResponsiveHelper.isDesktop(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quantity,
                        style: TajawalBold.copyWith(
                          fontSize: 30,
                          color: MyThemeData.light.focusColor,
                        ),
                      ),
                      Text(
                        title,
                        style: TajawalBold.copyWith(
                          fontSize: 13,
                          color: const Color(0xff9D9D9D),
                        ),
                      ),
                      60.verticalSpace,
                    ],
                  ),
                  8.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      20.verticalSpace,
                      Image.asset(
                        imagePath,
                        height: MediaQuery.of(context).size.height * 1 / 7.5,
                        width: MediaQuery.of(context).size.height * 1 / 7.0,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    quantity,
                    style: TajawalBold.copyWith(
                      fontSize: 30,
                      color: MyThemeData.light.focusColor,
                    ),
                  ),
                  Text(
                    title,
                    style: TajawalBold.copyWith(
                      fontSize: 13,
                      color: const Color(0xff9D9D9D),
                    ),
                  ),
                  if (ResponsiveHelper.isDesktop(context)) 60.verticalSpace,
                ],
              ),
      ),
    );
  }
}
