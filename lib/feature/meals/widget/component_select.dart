import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class ComponentSelect extends StatefulWidget {
  const ComponentSelect({super.key});

  @override
  ComponentSelectState createState() => ComponentSelectState();
}

class ComponentSelectState extends State<ComponentSelect> {
  final ComponentController componentController = Get.find<ComponentController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MealsController mealsController = Get.find<MealsController>();

  CreateComponents?  selectedComponents;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.category,
                          height: 20,
                          width: 20,
                          color: MyThemeData.light.focusColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Component'.tr,
                          style: TajawalBold.copyWith(
                            fontSize: 14,
                            color: MyThemeData.light.focusColor,
                          ),
                        ).paddingOnly(top: 5),
                      ],
                    ),
                    Obx(() {
                      switch (mealsController.controllerState.value) {
                        case ControllerState.loading:
                          return const Center(
                            child: SizedBox(height: 100),
                          );
                        default:
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio: 0.9,
                              ),
                              itemCount: componentController.componentList.length,
                              itemBuilder: (context, index) {
                                final component = componentController.componentList[index];
                                final isSelected = mealsController.selectedComponentsList
                                    .any((element) => element.componentId == component.id);
                                final selectedComponent = mealsController.selectedComponentsList
                                    .firstWhere(
                                      (element) => element.componentId == component.id,
                                  orElse: () => CreateComponents(
                                    componentId: component.id!,
                                    status: 1,
                                    isDefault: 0,
                                    price: 0,
                                  ),
                                );

                                return OnHover(
                                  matrix: 0,
                                  onTap: () {
                                    selectedComponents = CreateComponents(
                                      componentId: component.id!,
                                      isDefault: 1,
                                      status: 1,
                                      price: 0,
                                    );
                                    if (isSelected) {
                                      mealsController.selectedComponentsList.removeWhere(
                                              (element) => element.componentId == component.id);
                                    } else {
                                      mealsController.selectedComponentsList
                                          .add(selectedComponents!);
                                    }
                                    setState(() {
                                      print(selectedComponents?.toJson());
                                      print(mealsController.selectedComponentsList.toJson());
                                    });
                                  },
                                  builder: (isHovered) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: isSelected
                                              ? MyThemeData.light.primaryColor
                                              : Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, -1),
                                            color: Colors.black.withOpacity(.07),
                                            blurRadius: 8,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(100),
                                                      child: SizedBox(
                                                        width: 36,
                                                        height: 36,
                                                        child: Image.network(
                                                          componentController.componentList[index].image ?? '',
                                                          height: 36,
                                                          width: 36,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      languageController.langLocal == eng
                                                          ? componentController.componentList[index].nameEn ?? ''
                                                          : languageController.langLocal == ara
                                                          ? componentController.componentList[index].nameAr ?? ''
                                                          : componentController.componentList[index].nameHe ?? '',
                                                      style: TajawalRegular.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            if (isSelected)
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Default'.tr,
                                                      style: TajawalBold.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedComponent.isDefault = 1;
                                                              print(selectedComponents?.toJson());
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 8,
                                                                backgroundColor: selectedComponent.isDefault == 1
                                                                    ? MyThemeData.light.primaryColor
                                                                    : MyThemeData.light.hoverColor,
                                                                child: selectedComponent.isDefault == 1
                                                                    ? const Center(
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    color: Colors.white,
                                                                    size: 13,
                                                                  ),
                                                                )
                                                                    : null,
                                                              ),
                                                              const SizedBox(width: 4),
                                                              Text(
                                                                'yes'.tr,
                                                                style: TajawalRegular.copyWith(
                                                                  fontSize: 14,
                                                                ),
                                                              ).paddingOnly(top: 5),
                                                            ],
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedComponent.isDefault = 0;
                                                              print(selectedComponents?.toJson());
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 8,
                                                                backgroundColor: selectedComponent.isDefault == 0
                                                                    ? MyThemeData.light.primaryColor
                                                                    : MyThemeData.light.hoverColor,
                                                                child: selectedComponent.isDefault == 0
                                                                    ? const Center(
                                                                  child: Icon(
                                                                    Icons.check,
                                                                    color: Colors.white,
                                                                    size: 13,
                                                                  ),
                                                                )
                                                                    : null,
                                                              ),
                                                              const SizedBox(width: 4),
                                                              Text(
                                                                'no'.tr,
                                                                style: TajawalRegular.copyWith(
                                                                  fontSize: 14,
                                                                ),
                                                              ).paddingOnly(top: 5),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    if(selectedComponent.isDefault == 0)
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                'Price'.tr,
                                                                style: TajawalRegular.copyWith(
                                                                  fontSize: 12,
                                                                ),
                                                              ).paddingSymmetric(vertical: 3),
                                                              SizedBox(
                                                                width: 60,
                                                                child: CustomTextField(
                                                                  height: 30,
                                                                  radius: 5,
                                                                  inputType: TextInputType.phone,
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      selectedComponent.price = int.tryParse(value) ?? 0;
                                                                      print(selectedComponents?.toJson());
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ).paddingOnly(top: 28);
                                  },
                                );
                              },
                            ),
                          );
                      }
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
