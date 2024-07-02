import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get.dart';

class QuestionsPhotosWidget extends StatelessWidget {
  const QuestionsPhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find<LanguageController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<QuestionsController>(
        builder: (questionsController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height * 1 / 2.7,
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
                  isQuestion: true,
                  webImage: questionsController.webImage,
                  pickedImage: questionsController.pickedImage,
                  pickedProfileImageFile: questionsController.pickedProfileImageFile,
                ),
              ),
            ),
            //10.verticalSpace,
            // Row(
            //   children: [
            //     Expanded(
            //       child: SizedBox(
            //         height: MediaQuery.of(context).size.height * 1 / 7.5,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 2,
            //           itemBuilder: (context, index) {
            //             return Container(
            //               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            //               margin:  EdgeInsets.only(
            //                 right: languageController.langLocal == eng ? 10 : 0,
            //                 left: languageController.langLocal == eng ? 0 : 10,
            //               ),
            //               width: MediaQuery.of(context).size.height * 1 / 4.5,
            //               height: MediaQuery.of(context).size.height * 1 / 7.5,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(15),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     offset: const Offset(0, 0),
            //                     color: Colors.black.withOpacity(0.02),
            //                     blurRadius: 14,
            //                     spreadRadius: 9,
            //                   )
            //                 ],
            //               ),
            //               child: Center(child: AddPhotoWidget()),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
