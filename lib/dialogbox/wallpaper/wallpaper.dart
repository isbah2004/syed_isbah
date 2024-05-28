import 'package:flutter/material.dart';
import 'package:my_portfolio/dialogbox/wallpaper/desktop_wallpaper.dart';
import 'package:my_portfolio/dialogbox/wallpaper/large_tablet_wallpaper.dart';
import 'package:my_portfolio/dialogbox/wallpaper/mobile_wallpaper.dart';
import 'package:my_portfolio/dialogbox/wallpaper/small_tablet_wallpaper.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

void showWallpaperDialogBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutHelper(
        mobileBody: showMobileWallpaperDialogBox(context),
        largeTabletBody: showLargeTabletWallpaperDialogBox(context),
        desktopBody: showDesktopWallpaperDialogBox(context),
        smallTabletBody: showSmallTabletWallpaperDialogBox(context),
      );
    },
  );
}
