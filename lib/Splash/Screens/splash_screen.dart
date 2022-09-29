import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Splash/Controller/splash_controller.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetPaths.SPLASH_IMAGE), fit: BoxFit.fill),
      ),
      child: AppLogo(scale: 5.0.w),
    );
  }
}
