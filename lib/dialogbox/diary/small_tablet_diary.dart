  import 'package:flutter/material.dart';
import 'package:my_portfolio/reusablewidgets/apk_downloader.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
 
  Widget showSmallTabletDiaryDialogBox(BuildContext context) {
   
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 1,
            width: MediaQuery.of(context).size.width / 1.5,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      'Diary App',
                      style: AppTheme.font25Bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        height: 500,
                        image: AssetImage(
                          Constants.diary1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        height: 500,
                        image: AssetImage(
                          Constants.diary2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        height: 500,
                        image: AssetImage(
                          Constants.diary3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {downloadFile(Constants.diary, Constants.diaryPath);},
                      child: Text(
                        'Download Apk',
                        style: AppTheme.font20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
   
