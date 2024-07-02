import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class NamesTextField extends StatelessWidget {
  final String title;
  final String hintTitle;
  final String? hintTitle2;
  final TextEditingController? nameController;
  final TextEditingController? detailsController;
  final GlobalKey<FormState>? formKey;

  const NamesTextField({
    super.key,
    required this.title,
    required this.hintTitle,
    this.hintTitle2,
    this.formKey,
    this.nameController,
    this.detailsController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TajawalRegular.copyWith(
              fontSize: 16,
              color: Colors.black,
            ),
          ).paddingAll(5),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: CustomTextField(
              hintText: hintTitle2 ?? 'Question'.tr,
              height: 45,
              radius: 30,
              filled: false,
              controller: nameController,
              onValidate: (String? value) {
                if (value == null) {
                  return 'Field is required'.tr;
                }
                return null;
              },
            ),
          ),
          30.verticalSpace,
          Text(
            hintTitle,
            style: TajawalRegular.copyWith(
              fontSize: 16,
              color: Colors.black,
            ),
          ).paddingAll(5),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              minLines: 15,
              maxLines: 30,
              controller: detailsController,
              style: TajawalRegular.copyWith(
                fontSize: 16,
              ),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintTitle,
                hintStyle: TajawalLight.copyWith(
                  fontSize: 14,
                  color: Theme.of(context).hintColor.withOpacity(1),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xff000000).withOpacity(0.11),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xff000000).withOpacity(0.11),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xff000000).withOpacity(0.11),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
              ),
              validator: (String? value) {
                if (value == null) {
                  return 'Field is required'.tr;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
