import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/documents_module/Controller/document_controller.dart';
import 'package:royalty_nurse/documents_module/widgets/UploadWidget.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class UploadDocumentsScreen extends StatelessWidget {
  UploadDocumentsScreen({Key? key}) : super(key: key);
  final controller = Get.put(DocumentsController());
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.UPLOAD_DOCUMENTS_TEXT,
      child: CustomMainContainer(
        child: Column(children: [
          //--------------------Document List Create----------------------
          GetBuilder<DocumentsController>(
            builder: (controller) => Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.documents.length,
                  itemBuilder: (context, index) {
                    String key = controller.documents[index].model!;
                    var file = controller.images[key];
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0.03.sh),
                          CustomText(
                              maintext:
                                  "    ${index + 1} .${controller.documents[index].name}"),
                          UploadWidget(
                            onTap: () {
                              //------------Bottom Sheet For Selecting-----------
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      bottomsheet(context, index));
                            },
                            child: file == null
                                //------------Upload Document Container---------
                                ? uploadContainerColumnWidget()
                                : file.split('.').last == "pdf"
                                    //------------PDF Icon Show-----------------
                                    ? pdfImageWidget()
                                    //---------------Image Show-----------------
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        child: Image(
                                            image: FileImage(File(file)),
                                            fit: BoxFit.cover),
                                      ),
                          ),
                        ]);
                  }),
            ),
          ),
          //-----------------Complete Application Button------------------------
          SizedBox(height: 10.h),
          completeAplicationButtonWidget(context),
          SizedBox(height: 10.h),
        ]),
      ),
    );
  }

  bottomsheet(BuildContext context, index) {
    return Container(
      color: AppColors.PURPLE_COLOR,
      height: 40.h,
      width: double.infinity,
      child: Column(children: [
        InkWell(
          onTap: () {
            controller.getFile(controller.documents[index].model);
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
            child: Row(children: [
              const Icon(Icons.file_copy_rounded, color: AppColors.WHITE_COLOR),
              SizedBox(width: 10.h),
              CustomText(maintext: "File", color: AppColors.WHITE_COLOR),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget uploadContainerColumnWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image(
          image: const AssetImage(AssetPaths.UPLOAD_GREY_ICON),
          width: 0.2.sw,
          height: 0.06.sh),
      CustomText(
          maintext: AppStrings.UPLOAD_DOCUMENTS_TEXT, is_alignLeft: false),
    ]);
  }

  Widget pdfImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: const FadeInImage(
          placeholder: AssetImage(AssetPaths.PDF_IMAGE),
          image: AssetImage(AssetPaths.PDF_IMAGE),
          fit: BoxFit.fill),
    );
  }

  Widget completeAplicationButtonWidget(BuildContext context) {
    return CustomButton(
        text: AppStrings.COMPLETE_APPLICATION_BUTTON_TEXT,
        onclick: () {
          controller.uploadDocs(context, true);
        });
  }
}
