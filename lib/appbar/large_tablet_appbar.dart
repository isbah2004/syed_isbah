import 'package:flutter/material.dart';
import 'package:my_portfolio/projects/projects.dart';
import 'package:my_portfolio/provider/neumorphism_button.dart';
import 'package:my_portfolio/reusablewidgets/neumorphism_button.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

AppBar largeTabletAppBar(
    {required VoidCallback onTap1, onTap2, onTap3, onTap4}) {
  return AppBar(
    toolbarHeight: 100,
    leading: const SizedBox(),
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(color: AppTheme.primaryColor,image: DecorationImage(image: AssetImage(Constants.logo),),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<NeumorphismProvider>(
              builder: (context, value, child) {
                return NeumorphismButton(
                  isPress: value.isHomePressed,
                  onEnter: (_) {
                    value.setHomePressed(true);
                  },
                  onExit: (_) {
                    value.setHomePressed(false);
                  },
                  onTap: onTap1,
                  height: 40,
                  width: 80,
                  child: Text(Constants.homeText, style: AppTheme.font20),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Consumer<NeumorphismProvider>(
              builder: (context, value, child) {
                return NeumorphismButton(
                  isPress: value.isAboutPressed,
                  onEnter: (_) {
                    value.setAboutPressed(true);
                  },
                  onExit: (_) {
                    value.setAboutPressed(false);
                  },
                  onTap: onTap2,
                  height: 40,
                  width: 80,
                  child: Text(Constants.aboutText, style: AppTheme.font20),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Consumer<NeumorphismProvider>(
              builder: (context, value, child) {
                return NeumorphismButton(
                  isPress: value.isSkillsPressed,
                  onEnter: (_) {
                    value.setSkillsPressed(true);
                  },
                  onExit: (_) {
                    value.setSkillsPressed(false);
                  },
                  onTap: onTap3,
                  height: 40,
                  width: 80,
                  child: Text(
                    Constants.skillsText,
                    style: AppTheme.font20,
                  ),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Consumer<NeumorphismProvider>(
              builder: (context, value, child) {
                return NeumorphismButton(
                  isPress: value.isProjectsPressed,
                  onEnter: (_) {
                    value.setProjectsPressed(true);
                  },
                  onExit: (_) {
                    value.setProjectsPressed(false);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Projects(),
                      ),
                    );
                  },
                  height: 40,
                  width: 120,
                  child: Hero(
                    tag: Constants.projectText,
                    child: Text(
                      Constants.projectText,
                      style: AppTheme.font20,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Consumer<NeumorphismProvider>(
              builder: (context, value, child) {
                return NeumorphismButton(
                  isPress: value.isContactPressed,
                  onEnter: (_) {
                    value.setContactPressed(true);
                  },
                  onExit: (_) {
                    value.setContactPressed(false);
                  },
                  onTap: onTap4,
                  height: 40,
                  width: 100,
                  child: Text(
                    Constants.contactText,
                    style: AppTheme.font20,
                  ),
                );
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ],
    ),
  );
}
