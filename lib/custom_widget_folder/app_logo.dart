import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class AppLogo extends StatelessWidget {
  double? scale;
  AppLogo({Key? key, this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetPaths.APP_LOGO_IMAGE, scale: scale ?? 6.w);
  }
}
