import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_tab.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/documents_module/Controller/document_controller.dart';
import 'package:royalty_nurse/documents_module/widgets/custom_single_list.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class DocumentsRequiredAdditional extends StatelessWidget {
  DocumentsController controller = Get.put(DocumentsController());
  DocumentsRequiredAdditional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.DOCUMENTS_TEXT,
      child: CustomMainContainer(
        child: Column(children: [
          //------------------------Tab Bar-------------------------
          tabBarWidget(),
          SizedBox(height: 10.h),
          //----------------------Next Button-------------------------
          nextButtonWidget(context),
          SizedBox(height: 10.h),
        ]),
      ),
    );
  }

  Widget requiredDocuments() {
    return GetBuilder<DocumentsController>(
      builder: (controller) => ListView.builder(
          itemCount: controller.documents.length,
          itemBuilder: (context, index) {
            String key = controller.documents[index].model!;
            var file = controller.images[key];
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSingleList(
                    onclick: () {
                      controller.getFile(controller.documents[index].model);
                    },
                    firstText: controller.documents[index].name!,
                    status: controller.documents[index].status!,
                    image: file == null
                        ? Image.asset(
                            AssetPaths.UPLOAD_GREY_ICON,
                            scale: 8.w,
                          )
                        : Image.asset(
                            AssetPaths.UPLOAD_BLACK_ICON,
                            scale: 3.5.w,
                          ),
                  ),
                ]);
          }),
    );
  }

  Widget tabBarWidget() {
    return Expanded(
      child: CustomTab(
        firstTXT: AppStrings.REQUIRED_BUTTON_TEXT,
        secondTXT: AppStrings.ADDITIONAL_BUTTON_TEXT,
        firstWidget: requiredDocuments(),
        secondWidget: CustomText(maintext: "No Data", is_alignLeft: false),
      ),
    );
  }

  Widget nextButtonWidget(BuildContext context) {
    return CustomButton(
        text: AppStrings.NEXT_BUTTON_TEXT,
        onclick: () {
          controller.uploadDocs(context, false);
        });
  }
}
