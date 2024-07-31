import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:image_picker/image_picker.dart'; // Add this import

class AttributesSelect extends StatefulWidget {
  const AttributesSelect({super.key});

  @override
  AttributesSelectState createState() => AttributesSelectState();
}

class AttributesSelectState extends State<AttributesSelect> {
  final AttributeController attributeController = Get.find<AttributeController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MealsController mealsController = Get.find<MealsController>();
  final ImagePicker _picker = ImagePicker(); // Add ImagePicker instance

  Map<int, List<CreateAttributes>> attributesMap = {};
  List<TextEditingController> nameArControllers = [];
  List<TextEditingController> nameEnControllers = [];
  List<TextEditingController> nameHeControllers = [];
  List<TextEditingController> priceControllers = [];
  List<String> dropdownValues = [];
  List<XFile?> pickedImages = []; // Store picked images

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: MediaQuery.of(context).size.height * 1 / 0.8,
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
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Images.Elements,
                    height: 20,
                    width: 20,
                    color: MyThemeData.light.focusColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Attributes'.tr,
                    style: TajawalBold.copyWith(
                      fontSize: 14,
                      color: MyThemeData.light.focusColor,
                    ),
                  ).paddingOnly(top: 5),
                ],
              ),
              30.verticalSpace,
              Obx(() {
                switch (mealsController.controllerState.value) {
                  case ControllerState.loading:
                    return const Center(
                      child: SizedBox(height: 100),
                    );
                  default:
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              childAspectRatio: 4.0,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemCount: attributeController.attributeList.length,
                            itemBuilder: (context, index) {
                              final attribute =
                              attributeController.attributeList[index];
                              final isSelected = mealsController
                                  .selectedAttributesList
                                  .any((element) =>
                              element.attributeId == attribute.id);
                              final selectedAttribute = mealsController
                                  .selectedAttributesList
                                  .firstWhere(
                                    (element) => element.attributeId == attribute.id,
                                orElse: () => CreateAttributes(
                                  attributeId: attribute.id!,
                                  image: '',
                                  nameAr: attribute.nameAr!,
                                  nameEn: attribute.nameEn!,
                                  nameHe: attribute.nameHe!,
                                  isCheck: 0,
                                  price: 0,
                                ),
                              );
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OnHover(
                                    matrix: 0,
                                    onTap: () {
                                      if (isSelected) {
                                        mealsController.selectedAttributesList
                                            .removeWhere((element) =>
                                        element.attributeId ==
                                            attribute.id);
                                        attributesMap.remove(attribute.id);
                                      } else {
                                        if (!mealsController
                                            .selectedAttributesList
                                            .contains(selectedAttribute)) {
                                          mealsController
                                              .selectedAttributesList
                                              .add(selectedAttribute);
                                        }
                                        if (!attributesMap
                                            .containsKey(attribute.id)) {
                                          attributesMap[attribute.id!] = [
                                            selectedAttribute
                                          ];
                                        }
                                      }
                                      setState(() {});
                                    },
                                    builder: (isHovered) {
                                      return Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 8,
                                            backgroundColor: isSelected
                                                ? MyThemeData
                                                .light.primaryColor
                                                : Colors.grey,
                                            child: Center(
                                              child: isSelected
                                                  ? const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 13,
                                              )
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            languageController.langLocal == eng
                                                ? attributeController
                                                .attributeList[index]
                                                .nameEn ??
                                                ''
                                                : languageController.langLocal ==
                                                ara
                                                ? attributeController
                                                .attributeList[
                                            index]
                                                .nameAr ??
                                                ''
                                                : attributeController
                                                .attributeList[
                                            index]
                                                .nameHe ??
                                                '',
                                            style: TajawalRegular.copyWith(
                                              fontSize: 14,
                                            ),
                                          ).paddingOnly(top: 5),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        if (mealsController.selectedAttributesList.isNotEmpty) ...[
                          for (var attribute
                          in mealsController.selectedAttributesList) ...[
                            Text(
                              'Items for ${attribute.nameEn} (${attribute.nameAr}, ${attribute.nameHe})',
                              style: TajawalBold.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ..._buildAttributeForm(attribute),
                          ],
                        ],
                      ],
                    );
                }
              }),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildAttributeForm(CreateAttributes attribute) {
    final attributeId = attribute.attributeId!;
    final nameArController = TextEditingController();
    final nameEnController = TextEditingController();
    final nameHeController = TextEditingController();
    final priceController = TextEditingController();
    String dropdownValue = 'Default';
    final pickedImage = ValueNotifier<File?>(null);

    nameArControllers.add(nameArController);
    nameEnControllers.add(nameEnController);
    nameHeControllers.add(nameHeController);
    priceControllers.add(priceController);
    dropdownValues.add(dropdownValue);

    return [
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: nameArController,
              decoration: InputDecoration(
                labelText: 'اسم العنصر بالعربية',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: nameEnController,
              decoration: InputDecoration(
                labelText: 'اسم العنصر بالإنجليزية',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: nameHeController,
              decoration: InputDecoration(
                labelText: 'اسم العنصر بالعبرية',
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      DropdownButton<String>(
        value: dropdownValue,
        items: <String>['Default', 'Not Default']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            if (dropdownValue == 'Default') {
              priceController.clear();
            }
          });
        },
      ),
      if (dropdownValue == 'Not Default') ...[
        const SizedBox(height: 10),
        TextField(
          controller: priceController,
          decoration: InputDecoration(
            labelText: 'السعر',
          ),
          keyboardType: TextInputType.number,
        ),
      ],
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  pickedImage.value = File(pickedFile.path);
                }
              },
              child: Text('Pick Image'),
            ),
          ),
          const SizedBox(width: 10),
          ValueListenableBuilder<File?>(
            valueListenable: pickedImage,
            builder: (context, file, child) {
              return file != null
                  ? Text('Image Path: ${file.path}')
                  : Text('No image selected');
            },
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final newAttribute = CreateAttributes(
                  attributeId: attributeId,
                  nameAr: nameArController.text,
                  nameEn: nameEnController.text,
                  nameHe: nameHeController.text,
                  price: dropdownValue == 'Not Default'
                      ? int.tryParse(priceController.text) ?? 0
                      : 0,
                  image: pickedImage.value?.path ?? '',
                  isCheck: 0,
                );
                if (attributesMap.containsKey(attributeId)) {
                  attributesMap[attributeId]?.add(newAttribute);
                } else {
                  attributesMap[attributeId] = [newAttribute];
                }
                setState(() {
                  nameArControllers.add(TextEditingController());
                  nameEnControllers.add(TextEditingController());
                  nameHeControllers.add(TextEditingController());
                  priceControllers.add(TextEditingController());
                  dropdownValues.add('Default');
                  pickedImages.add(null);
                });
              },
              child: Text('Add Item'),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Column(
        children: attributesMap[attributeId]
            ?.map((attr) => ListTile(
          title: Text(
            '${attr.nameEn} (${attr.nameAr}, ${attr.nameHe})',
          ),
          subtitle: Text('Price: ${attr.price}'),
          trailing: attributesMap[attributeId]!.length > 2
              ? IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                attributesMap[attributeId]?.remove(attr);
                if (attributesMap[attributeId]?.isEmpty ?? true) {
                  attributesMap.remove(attributeId);
                }
              });
            },
          )
              : null,
        ))
            .toList() ??
            [],
      ),
    ];
  }

}
