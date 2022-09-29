import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomDropdownField extends StatelessWidget {
  List? Itemsss;
  String? value;
  Function(String?)? onchange;
  CustomDropdownField({Key? key, this.Itemsss, this.onchange, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        hint: CustomText(
            maintext: "Position Applied for", color: AppColors.GREY_COLOR),
        value: value,
        isExpanded: false,
        icon: const Icon(Icons.keyboard_arrow_down),
        elevation: 16,
        style: TextStyle(color: AppColors.BLACK_COLOR, fontSize: 20.sp),
        onChanged: onchange,
        validator: (value) => value == null ? "Please Select Position" : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 230, 225, 240).withOpacity(0.1),
          contentPadding: EdgeInsets.only(left: 25.w, right: 25.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  BorderSide(color: AppColors.PURPLE_COLOR.withOpacity(0.1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  BorderSide(color: AppColors.PURPLE_COLOR.withOpacity(0.4))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  BorderSide(color: AppColors.PURPLE_COLOR.withOpacity(0.4))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  BorderSide(color: AppColors.RED_COLOR.withOpacity(0.4))),
        ),
        items: Itemsss!.map<DropdownMenuItem<String>>((dynamic item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(fontSize: 20.sp),
            ),
          );
        }).toList(),
      ),
    );
  }
}
