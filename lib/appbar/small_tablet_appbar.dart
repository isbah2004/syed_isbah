import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';


AppBar smallTabletAppBar() {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 100,
    title: Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(color: AppTheme.primaryColor,image: DecorationImage(image: AssetImage(Constants.logo),),),
    ),
  );
}
