import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/Drawer/widget/drawer_nav_list.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPaths.BACKGROUND_IMAGE), fit: BoxFit.fill),
        ),
        child: DrawerNavList(),
      ),
    );
  }
}
