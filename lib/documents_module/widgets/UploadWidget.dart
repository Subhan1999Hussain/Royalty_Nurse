import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';

class UploadWidget extends StatelessWidget {
  Function()? onTap;
  Widget child;
  UploadWidget({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(height: 0.2.sh, child: child),
    );
  }
}
