import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddPhotoWidget extends StatefulWidget {
  final double? vertical;
  final bool isEdit;
  final double? width;
  final double? height;
  final String? imagePath;
  XFile? pickedProfileImageFile;
  dynamic webImage;
  File? pickedImage;
  final bool? isCategory;
  final bool? isComponent;
  final bool? isHashtag;
  final bool? isQuestion;

  AddPhotoWidget({
    super.key,
    this.isEdit = false,
    this.vertical,
    this.height,
    this.width,
    this.isCategory,
    this.isQuestion,
    this.isHashtag,
    this.isComponent,
    this.imagePath,
    this.pickedProfileImageFile,
    this.webImage,
    this.pickedImage,
  });

  @override
  _AddPhotoWidgetState createState() => _AddPhotoWidgetState();
}

class _AddPhotoWidgetState extends State<AddPhotoWidget> {

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      widget.pickedProfileImageFile = await picker.pickImage(source: ImageSource.gallery);
      if (widget.pickedProfileImageFile != null) {
        if (kIsWeb) {
          widget.webImage = await widget.pickedProfileImageFile!.readAsBytes();
          if(widget.isCategory == true) {
            Get.find<CategoryController>().webImage = widget.webImage;
          }
          if(widget.isComponent == true) {
            Get.find<ComponentController>().webImage = widget.webImage;
          }
          if(widget.isHashtag == true) {
            Get.find<HashtagController>().webImage = widget.webImage;
          }
          if(widget.isQuestion == true) {
            Get.find<QuestionsController>().webImage = widget.webImage;
          }
        } else {
          widget.pickedImage = File(widget.pickedProfileImageFile!.path);
        }
      } else {
        print('No Image has been picked');
      }
    } catch (e) {
      print('Something went wrong: $e');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: widget.height ?? MediaQuery.of(context).size.height * 1 / 2.5,
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
        onTap: () async {
          await pickImage();
        },
        builder: (isHovered) {
          return widget.pickedProfileImageFile == null
              ? SvgPicture.asset(
                  Images.add_photo,
                  fit: BoxFit.none,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 50,
                    width: 80,
                    child: widget.isEdit &&
                            widget.imagePath != null &&
                            widget.pickedProfileImageFile?.path == null
                        ? Image.network(widget.imagePath!)
                        : kIsWeb && widget.webImage != null
                            ? Image.memory(
                                widget.webImage!,
                                fit: BoxFit.none,
                              )
                            : Image.file(
                                File(widget.pickedProfileImageFile!.path),
                                fit: BoxFit.fill,
                              ),
                  ),
                );
        },
      ),
    );
  }
}
