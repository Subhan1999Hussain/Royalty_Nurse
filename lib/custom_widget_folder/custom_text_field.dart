import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  String? prefxicon;
  double? prefixIconSize;
  double? prefixRIghtPadding, sufixRIghtPadding;
  String? sufixicon;
  String? error;
  String? initialValue;
  final String hint;
  final double? fontsize, width;
  final bool? obscureText;
  TextEditingController? controller;
  void Function(String?)? onsave;
  String? Function(String?)? validator;
  void Function(String)? onchange;

  final void Function()? onclick;
  CustomTextField({
    Key? key,
    this.prefxicon,
    this.prefixIconSize,
    this.prefixRIghtPadding,
    this.sufixRIghtPadding,
    this.sufixicon,
    this.error,
    this.obscureText = false,
    this.initialValue,
    required this.hint,
    this.fontsize,
    this.width,
    this.onclick,
    this.controller,
    this.onsave,
    this.validator,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            onChanged: onchange,
            initialValue: initialValue,
            validator: validator,
            controller: controller,
            onSaved: onsave,
            obscureText: obscureText!,
            style: TextStyle(
              fontSize: fontsize ?? 20.sp
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 230, 225, 240).withOpacity(0.1),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                      color: AppColors.PURPLE_COLOR.withOpacity(0.1))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                      color: AppColors.PURPLE_COLOR.withOpacity(0.4))),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(
                      color: AppColors.PURPLE_COLOR.withOpacity(0.4))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide:
                      BorderSide(color: AppColors.RED_COLOR.withOpacity(0.4))),
              contentPadding: prefxicon == null
                  ? EdgeInsets.only(
                      left: 25.w
                    )
                  : null,
              hintText: hint,
              hintStyle: const TextStyle(
                color: AppColors.GREY_COLOR
              ),
              border: InputBorder.none,
              isDense: true,
              prefixIcon: prefxicon != null
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: 25.w, right: prefixRIghtPadding ?? 25.w),
                      child: Image.asset(prefxicon!,
                          width: prefixIconSize ?? 28.0.w))
                  : null,
              prefixIconConstraints: BoxConstraints(),
              suffixIcon: sufixicon != null
                  ? GestureDetector(
                      onTap: onclick,
                      child: Padding(
                          padding:
                              EdgeInsets.only(right: sufixRIghtPadding ?? 15.w),
                          child: Image.asset(
                            sufixicon!,
                            width: 2.0.w
                          )),
                    )
                  : SizedBox(
                      height: 0.07.sh
                    ),
            ),
          ),
        ),
        Text(error ?? ''),
      ]
    );
  }
}
