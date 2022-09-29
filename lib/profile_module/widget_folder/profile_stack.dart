import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

File? pickedFile;
final box = GetStorage();

class ProfileStack extends StatelessWidget {
  String? imagePath, profilePicPath;
  RxBool? profilePicPathSet;
  dynamic controller;
  ProfileStack(
      {Key? key,
      this.imagePath,
      this.profilePicPathSet,
      this.profilePicPath,
      this.controller})
      : super(key: key);

  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 150.h,
      child: Stack(children: [
        //----------------Profile Pic----------------
        profilePicWidget(),
        //----------------Upload Container----------------
        uploadIconWidget(context),
      ]),
    );
  }

  bottomsheet(BuildContext context) {
    return Container(
      color: AppColors.PURPLE_COLOR,
      height: 0.13.sh,
      width: double.infinity,
      child: Column(children: [
        InkWell(
          onTap: () {
            takephoto(ImageSource.camera);
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 8.0, right: 8.0, bottom: 5.0),
            child: Row(children: [
              const Icon(Icons.camera_alt_sharp, color: AppColors.WHITE_COLOR),
              SizedBox(width: 10.h),
              CustomText(maintext: "CAMERA", color: AppColors.WHITE_COLOR),
            ]),
          ),
        ),
        const Divider(color: AppColors.WHITE_COLOR, thickness: 1),
        InkWell(
          onTap: () {
            takephoto(ImageSource.gallery);
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
            child: Row(children: [
              const Icon(Icons.image, color: AppColors.WHITE_COLOR),
              SizedBox(width: 10.h),
              CustomText(maintext: "GALLERY", color: AppColors.WHITE_COLOR),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget profilePicWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.PURPLE_COLOR, width: 3.w),
        shape: BoxShape.circle,
        image: DecorationImage(
            scale: 3.sp,
            image: profilePicPathSet == true
                ? FileImage(File(profilePicPath!))
                : box.read("user_Image") == null
                    ? const AssetImage(AssetPaths.AVATAR_MALE_IMAGE)
                    : NetworkImage(
                        NetworkStrings.baseUrl + box.read("user_Image"),
                      ) as ImageProvider,
            fit: BoxFit.cover),
      ),
    );
  }

  Widget uploadIconWidget(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 9.0.h),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => bottomsheet(context));
          },
          child: Container(
            width: 40.0.w,
            height: 40.0.h,
            decoration: BoxDecoration(
              color: AppColors.PURPLE_COLOR,
              shape: BoxShape.circle,
              image: DecorationImage(
                scale: 5.w,
                image: const AssetImage(AssetPaths.UPLOAD_ICON),
              ),
              border: Border.all(color: AppColors.WHITE_COLOR, width: 3.w),
            ),
          ),
        ),
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 25);
    _cropImage(pickedImage!.path);
  }

  void _cropImage(filePath) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    pickedFile = File(croppedImage!.path);
    controller.setprofilepath(pickedFile!.path);
    Get.back();
  }
}
