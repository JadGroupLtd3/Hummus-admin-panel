import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewDealsScreen extends StatefulWidget {
  final bool isEdit;
  final Deals? deals;
  const AddNewDealsScreen({super.key,this.isEdit = false, this.deals});

  @override
  State<AddNewDealsScreen> createState() => _AddNewDealsScreenState();
}

class _AddNewDealsScreenState extends State<AddNewDealsScreen> {
  final GlobalKey<FormState> dealKey = GlobalKey<FormState>();
  final DealsController dealsController = Get.find<DealsController>();
  @override
  void initState() {
    dealsController.initState();
    if(widget.isEdit == true){
      dealsController.isEdit(widget.deals!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GetBuilder<DealsController>(
            builder: (dealsController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Deals'.tr} / ${'edit deal'.tr}'
                        : '${'Home'.tr} / ${'Deals'.tr} / ${'Add New'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<SliderPagesController>(
                        builder: (sliderPagesController) {
                          return Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 0),
                                    color: Colors.black.withOpacity(0.02),
                                    blurRadius: 14,
                                    spreadRadius: 9,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  DealsNavBar(
                                    sliderPagesController: sliderPagesController,
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        1 /
                                        1.77,
                                    child: PageView(
                                      onPageChanged: sliderPagesController.animateToDealsNameTab,
                                      controller: sliderPagesController.dealPageController,
                                      physics: const NeverScrollableScrollPhysics(),
                                      clipBehavior: Clip.none,
                                      children: [...sliderPagesController.dealNamesPages],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: MediaQuery.of(context).size.height * 1 / 2.5,
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
                          child: Center(
                            child: AddPhotoWidget(
                              isDeal: true,
                              webImage: dealsController.webImage,
                              pickedImage: dealsController.pickedImage,
                              pickedProfileImageFile: dealsController.pickedProfileImageFile,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  DealsTextsField(
                    dealKey: dealKey,
                  ),
                  const SizedBox(height: 20),
                  DealMeals(),
                  const SizedBox(height: 10),
                  Obx(() {
                    switch (dealsController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              if (dealKey.currentState!.validate()) {
                                if(widget.isEdit == true){
                                  dealsController.updateDeals(context, widget.deals!.id);
                                }else {
                                  dealsController.createDeals(context);
                                }
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              if (dealKey.currentState!.validate()) {
                                if(widget.isEdit == true){
                                  dealsController.updateDeals(context, widget.deals!.id);
                                }else {
                                  dealsController.createDeals(context);
                                }
                              }
                            },
                          ),
                        );
                    }
                  }),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
