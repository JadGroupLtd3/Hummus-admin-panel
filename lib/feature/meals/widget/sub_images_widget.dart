import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'dart:typed_data';
import 'dart:io';

class SubImagesWidget extends StatefulWidget {
  final LanguageController languageController;

  const SubImagesWidget({super.key, required this.languageController});

  @override
  State<SubImagesWidget> createState() => _SubImagesWidgetState();
}

class _SubImagesWidgetState extends State<SubImagesWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            addPhoto(
              onTap: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  final bytes = await pickedFile.readAsBytes();
                  setState(() {
                    var image = CreateMealImages(image: pickedFile.path);
                    controller.selectedImagesList.add(image);
                    controller.pickedFile1 = pickedFile;
                    controller.webImage1 = bytes;
                  });
                }
              },
              onTapRemove: () {
                setState(() {
                  controller.selectedImagesList.removeWhere((image) => image.image == controller.pickedFile1?.path);
                  controller.pickedFile1 = null;
                  controller.webImage1 = null;
                });
              },
              pickedProfileImageFile: controller.pickedFile1,
              webImage: controller.webImage1,
              languageController: widget.languageController,
            ),
            addPhoto(
              onTap: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  final bytes = await pickedFile.readAsBytes();
                  setState(() {
                    var image = CreateMealImages(image: pickedFile.path);
                    controller.selectedImagesList.add(image);
                    controller.pickedFile2 = pickedFile;
                    controller.webImage2 = bytes;
                  });
                }
              },
              onTapRemove: () {
                setState(() {
                  controller.selectedImagesList.removeWhere((image) => image.image == controller.pickedFile2?.path);
                  controller.pickedFile2 = null;
                  controller.webImage2 = null;
                });
              },
              pickedProfileImageFile: controller.pickedFile2,
              webImage: controller.webImage2,
              languageController: widget.languageController,
            ),
            addPhoto(
              onTap: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  final bytes = await pickedFile.readAsBytes();
                  setState(() {
                    var image = CreateMealImages(image: pickedFile.path);
                    controller.selectedImagesList.add(image);
                    controller.pickedFile3 = pickedFile;
                    controller.webImage3 = bytes;
                  });
                }
              },
              onTapRemove: () {
                setState(() {
                  controller.selectedImagesList.removeWhere((image) => image.image == controller.pickedFile3?.path);
                  controller.pickedFile3 = null;
                  controller.webImage3 = null;
                });
              },
              pickedProfileImageFile: controller.pickedFile3,
              webImage: controller.webImage3,
              languageController: widget.languageController,
            ),
          ],
        );
      },
    );
  }

  Widget addPhoto({
    final String? imagePath,
    XFile? pickedProfileImageFile,
    Uint8List? webImage,
    void Function()? onTap,
    void Function()? onTapRemove,
    required LanguageController languageController,
  }) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 1 / 5.7,
          height: MediaQuery.of(context).size.height * 1 / 7.5,
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
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: MediaQuery.of(context).size.height * 1 / 2.5,
            width: double.infinity,
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
            child: OnHover(
              matrix: 0,
              onTap: onTap,
              builder: (isHovered) {
                return imagePath == null && pickedProfileImageFile == null
                    ? SvgPicture.asset(
                        Images.add_photo,
                        fit: BoxFit.none,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox(
                          height: 50,
                          width: 80,
                          child: imagePath != null &&
                                  pickedProfileImageFile?.path == null
                              ? Image.network(
                                  imagePath,
                                  fit: BoxFit.fill,
                                )
                              : kIsWeb && webImage != null
                                  ? Image.memory(
                                      webImage,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(pickedProfileImageFile!.path),
                                      fit: BoxFit.fill,
                                    ),
                        ),
                      );
              },
            ),
          ),
        ),
        if (pickedProfileImageFile != null)
        Positioned(
          left: 3,
          top: 2,
          child: OnHover(
            matrix: 0,
            onTap: onTapRemove,
            builder: (isHovered) => Image.asset(
              Images.remove,
              height: 20,
              width: 20,
            ),
          ),
        )
      ],
    );
  }
}
