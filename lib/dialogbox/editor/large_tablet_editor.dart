import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';

Widget showLargeTabletEditorDialogBox(BuildContext context) {
  return AlertDialog(
    content: SizedBox(
      height: MediaQuery.of(context).size.height / 1,
      width: MediaQuery.of(context).size.width / 1.1,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                textAlign: TextAlign.left,
                'Photo Editor',
                style: AppTheme.font25Bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      height: 430,
                      image: AssetImage(
                        Constants.photoEditor1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      height: 430,
                      image: AssetImage(
                        Constants.photoEditor2,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      height: 430,
                      image: AssetImage(
                        Constants.photoEditor3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                     launcher.launchUrl(Uri.parse(Constants.photoEditorPath));
                },
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
