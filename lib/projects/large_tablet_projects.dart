import 'package:flutter/material.dart';
import 'package:my_portfolio/dialogbox/diary/diary.dart';
import 'package:my_portfolio/dialogbox/editor/editor.dart';
import 'package:my_portfolio/dialogbox/wallpaper/wallpaper.dart';
import 'package:my_portfolio/reusablewidgets/project_overviewer.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';

class LargeTabletProjects extends StatelessWidget {
  const LargeTabletProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Hero(
          tag: Constants.projectText,
          child: Text(
            Constants.projectText,
            style: AppTheme.font35Bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProjectOverviewer(
                      title: Constants.photoEditor,
                      image: Constants.photoEditor1,
                      sizedBoxHeight: height / 1.2,
                      sizedBoxWidth: width / 3.5,
                      onTap: () {
                        showEditorDialogBox(context);
                      },
                    ),
                    ProjectOverviewer(
                      title: Constants.diaryApp,
                      image: Constants.diary1,
                      sizedBoxHeight: height / 1.2,
                      sizedBoxWidth: width / 3.5,
                      onTap: () {
                        showDiaryDialogBox(context);
                      },
                    ),
                    ProjectOverviewer(
                      title: Constants.wallpaperApp,
                      image: Constants.wallpaper1,
                      sizedBoxHeight: height / 1.2,
                      sizedBoxWidth: width / 3.5,
                      onTap: () {
                        showWallpaperDialogBox(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
