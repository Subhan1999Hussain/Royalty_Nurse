import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class AddNewCardAlertBox extends StatefulWidget {
  const AddNewCardAlertBox({Key? key}) : super(key: key);

  @override
  State<AddNewCardAlertBox> createState() => _AddNewCardAlertBoxState();
}

class _AddNewCardAlertBoxState extends State<AddNewCardAlertBox> {
  bool val = true;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(height: 20.h),
        //----------------Add New Card Text----------------
        addNewCardWidget(),
        //----------------Enter Card Detail Text----------------
        enterCardDetailsWidget(),
        SizedBox(height: 20.h),
        //----------------Inner Area---------------
        innerAreaWidget(),
        SizedBox(height: 15.h),
        //----------------Save Button----------------
        saveButtonWidget(),
      ]),
    );
  }

  Widget addNewCardWidget() {
    return CustomText(
        maintext: AppStrings.ADD_NEW_CARD_TEXT,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false,
        fontsize: 25.sp,
        fontWeight: FontWeight.w800);
  }

  Widget enterCardDetailsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: CustomText(
          maintext: AppStrings.ENTER_CARD_ETAILS_TEXT,
          fontsize: 16.sp,
          is_alignLeft: false),
    );
  }

  Widget innerAreaWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          SizedBox(height: 0.03.sh),
          //----------------Card Holder Name Field---------------
          CustomTextField(hint: AppStrings.CARD_HOLDER_NAME_FIELD_TEXT),
          SizedBox(height: 0.02.sh),
          //----------------Card Number Field---------------
          CustomTextField(hint: AppStrings.CARD_NUMBER_FIELD_TEXT),
          SizedBox(height: 0.02.sh),
          //----------------Expiry Date CVV Field---------------
          expiryDateCVVFieldWidget(),
          SizedBox(height: 0.02.sh),
          //----------------Set As Defualt---------------
          setAsDefualtWidget(),
        ],
      ),
    );
  }

  Widget saveButtonWidget() {
    return GestureDetector(
      onTap: () {
        Get.offNamed(Paths.PAYMENT_SETTINGS_SCREEN_ROUTE);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          gradient: LinearGradient(colors: [
            AppColors.BUTTON_GRADIENT1_COLOR,
            AppColors.BUTTON_GRADIENT2_COLOR,
            AppColors.BUTTON_GRADIENT3_COLOR,
            AppColors.BUTTON_GRADIENT4_COLOR,
          ]),
        ),
        height: 45.h,
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
          child: CustomText(
              maintext: AppStrings.SAVE_BUTTON_TEXT, is_alignLeft: false),
        ),
      ),
    );
  }

  Widget expiryDateCVVFieldWidget() {
    return Row(children: [
      Expanded(
        child: CustomTextField(hint: AppStrings.EXPIRY_DATE_FIELD_TEXT),
      ),
      SizedBox(width: 0.04.sw),
      CustomTextField(width: 100.w, hint: AppStrings.CVV_FIELD_TEXT),
    ]);
  }

  Widget setAsDefualtWidget() {
    return Row(children: [
      CustomText(
          maintext: AppStrings.SET_AS_DEFAULT_FIELD_TEXT,
          color: AppColors.PURPLE_COLOR,
          fontsize: 22.sp,
          fontWeight: FontWeight.w500),
      const Spacer(),
      CupertinoSwitch(
        value: val,
        onChanged: (bool value) {
          setState(() {
            val = value;
          });
        },
      ),
    ]);
  }
}
