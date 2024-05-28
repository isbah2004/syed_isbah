import 'package:flutter/material.dart';
import 'package:my_portfolio/homescreen/home_screen.dart';
import 'package:my_portfolio/provider/neumorphism_button.dart';
import 'package:my_portfolio/provider/skills_provider.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NeumorphismProvider()),
      ChangeNotifierProvider(create: (context) => ResumeProvider()),
      ChangeNotifierProvider(create: (context) => SkillsProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: Constants.name,
      home: const HomeScreen(),
    ),
  ));
}
