import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/skills_provider.dart';
import 'package:my_portfolio/reusablewidgets/neumorphism_button.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class LargeTabletSkill extends StatelessWidget {
  const LargeTabletSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Constants.skillsText,
              style: AppTheme.font35Bold,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                alignment: WrapAlignment.start,
                spacing: MediaQuery.of(context).size.width / 30,
                runSpacing: 25,
                children: [
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.dart,
                        onEnter: (_) {
                          value.setDart(true);
                        },
                        onExit: (_) {
                          value.setDart(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.dart,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.flutter,
                        onEnter: (_) {
                          value.setFlutter(true);
                        },
                        onExit: (_) {
                          value.setFlutter(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.flutter,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.python,
                        onEnter: (_) {
                          value.setPython(true);
                        },
                        onExit: (_) {
                          value.setPython(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.python,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.firebase,
                        onEnter: (_) {
                          value.setFirebase(true);
                        },
                        onExit: (_) {
                          value.setFirebase(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.firebase,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.restAPI,
                        onEnter: (_) {
                          value.setRestAPI(true);
                        },
                        onExit: (_) {
                          value.setRestAPI(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.restAPI,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.mongoDB,
                        onEnter: (_) {
                          value.setMongoDB(true);
                        },
                        onExit: (_) {
                          value.setMongoDB(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.mongoDB,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                  Consumer<SkillsProvider>(
                    builder: (context, value, child) {
                      return NeumorphismButton(
                        isPress: value.fastAPI,
                        onEnter: (_) {
                          value.setFastAPI(true);
                        },
                        onExit: (_) {
                          value.setFastAPI(false);
                        },
                        onTap: () {},
                        height: 50,
                        width: 150,
                        child: Text(
                          Constants.fastAPI,
                          style: AppTheme.font25,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
