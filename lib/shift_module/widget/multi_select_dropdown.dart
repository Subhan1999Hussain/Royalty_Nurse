import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class MultiSelectDropdown extends StatelessWidget {
  final String fieldText, maintext;
  final List<MultiSelectItem> chipItems;
  final List<dynamic> selectChipList;
  final Function(dynamic) onTap, onConfirm;
  const MultiSelectDropdown({
    Key? key,
    required this.fieldText,
    required this.maintext,
    required this.chipItems,
    required this.selectChipList,
    required this.onTap,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: [
        //---------------------Main Text--------------------------
        mainTextWidget(),
        SizedBox(height: 0.01.sh),
        //----------------Multi-Select Dialog---------------------
        multiSelectDialogWidget(),
        SizedBox(height: 0.03.h),
      ]),
    );
  }

  Widget mainTextWidget() {
    return CustomText(
        maintext: maintext,
        fontWeight: FontWeight.w800,
        color: AppColors.PURPLE_COLOR);
  }

  Widget multiSelectDialogWidget() {
    return MultiSelectDialogField(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.PURPLE_COLOR.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 3,
                  offset: const Offset(0, 2)),
            ],
            borderRadius: BorderRadius.circular(35),
            color: AppColors.WHITE_COLOR),
        buttonIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        buttonText: Text(
          fieldText,
          style: TextStyle(fontSize: 20.sp, color: AppColors.HINT_TEXT_COLOR),
        ),
        title: CustomText(maintext: fieldText, color: AppColors.PURPLE_COLOR),
        items: chipItems,
        listType: MultiSelectListType.LIST,
        chipDisplay: MultiSelectChipDisplay(
            chipColor: AppColors.WHITE_COLOR,
            textStyle:
                TextStyle(fontSize: 15.0.sp, color: AppColors.BLACK_COLOR),
            icon: const Icon(Icons.close, color: AppColors.BLACK_COLOR),
            items: selectChipList.map((e) => MultiSelectItem(e, e)).toList(),
            onTap: onTap),
        initialValue: selectChipList,
        onConfirm: onConfirm);
  }
}
