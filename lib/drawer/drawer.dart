import 'package:flutter/material.dart';
import 'package:my_portfolio/projects/projects.dart';
import 'package:my_portfolio/provider/neumorphism_button.dart';
import 'package:my_portfolio/reusablewidgets/neumorphism_button.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;
  final VoidCallback onTap4;
  const DrawerWidget(
      {super.key,
      required this.onTap1,
      required this.onTap2,
      required this.onTap3,
      required this.onTap4});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
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
                      width: 100,
                      child: Text(Constants.homeText, style: AppTheme.font25),
                    );
                  },
                ),
                const SizedBox(height: 40),
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
                      width: 100,
                      child: Text(Constants.aboutText, style: AppTheme.font25),
                    );
                  },
                ),
                const SizedBox(height: 40),
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
                      width: 100,
                      child: Text(
                        Constants.skillsText,
                        style: AppTheme.font25,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
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
                      width: 130,
                      child: Hero(
                        tag: Constants.projectText,
                        child: Text(
                          Constants.projectText,
                          style: AppTheme.font25,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
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
                      width: 120,
                      child: Text(
                        Constants.contactText,
                        style: AppTheme.font25,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
