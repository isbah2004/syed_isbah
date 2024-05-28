import 'package:flutter/material.dart';
import 'package:my_portfolio/dialogbox/editor/desktop_editor.dart';
import 'package:my_portfolio/dialogbox/editor/large_tablet_editor.dart';
import 'package:my_portfolio/dialogbox/editor/mobile_editor.dart';
import 'package:my_portfolio/dialogbox/editor/small_tablet_editor.dart';
import 'package:my_portfolio/reusablewidgets/layout_helper.dart';

void showEditorDialogBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutHelper(
        mobileBody: showMobileEditorDialogBox(context),
        largeTabletBody: showLargeTabletEditorDialogBox(context),
        desktopBody: showDesktopEditorDialogBox(context),
        smallTabletBody: showSmallTabletEditorDialogBox(context),
      );
    },
  );
}
