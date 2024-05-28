import 'package:flutter/material.dart';
import 'package:my_portfolio/dialogbox/diary/diary.dart';
import 'package:my_portfolio/dialogbox/editor/editor.dart';
import 'package:my_portfolio/dialogbox/wallpaper/wallpaper.dart';
import 'package:my_portfolio/reusablewidgets/project_overviewer.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';

class SmallTabletProjects extends StatelessWidget {
  const SmallTabletProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ProjectOverviewer(
                title: Constants.photoEditor,
                image: Constants.photoEditor1,
                sizedBoxHeight: height / 1.2,
                sizedBoxWidth: 300,
                onTap: () {
                  showEditorDialogBox(context);
                },
              ),
            ),
            Center(
              child: ProjectOverviewer(
                title: Constants.diaryApp,
                image: Constants.diary1,
                sizedBoxHeight: height / 1.2,
                sizedBoxWidth: 300,
                onTap: () {
                  showDiaryDialogBox(context);
                },
              ),
            ),
            Center(
              child: ProjectOverviewer(
                title: Constants.wallpaperApp,
                image: Constants.wallpaper1,
                sizedBoxHeight: height / 1.2,
                sizedBoxWidth: 300,
                onTap: () {
                  showWallpaperDialogBox(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
