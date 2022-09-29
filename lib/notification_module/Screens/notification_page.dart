import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/notification_module/Controller/notification_controller.dart';
import 'package:royalty_nurse/notification_module/widget/notiication_container.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class NotificationPage extends StatelessWidget {
  final NotificationController notifyController =
      Get.put(NotificationController());
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.NOTIFICATION_TEXT,
      child: CustomMainContainer(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 0.001.sh),
          //--------------------Notification List--------------------
          Expanded(child: notificationWidget()),
          SizedBox(height: 0.001.sh),
        ]),
      ),
    );
  }

  Widget notificationWidget() {
    return GetBuilder<NotificationController>(
        builder: (controller) => controller.notify.isEmpty
          ? CustomText(
              maintext: "No Data",
              is_alignLeft: false,
              color: AppColors.GREY_COLOR)
          :  ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.notify.length,
            itemBuilder: (BuildContext context, int index) {
              return NotificationContainer(
                firstText: controller.notify[index].senderName!,
                image: controller.notify[index].senderImage!,
                message: controller.notify[index].body!,
              );
            }));
  }
}
