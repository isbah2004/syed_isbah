import 'package:flutter/material.dart';
import 'package:my_portfolio/reusablewidgets/ink_widget.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class MobileContact extends StatelessWidget {
  const MobileContact({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Constants.name,
            style: AppTheme.font20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWidget(
                onTap: () {},
                asset: Constants.copywriteLogo,
                size: 15,
              ),
              Text(
                ' - 2024 @ ${Constants.name}',
                style: AppTheme.font15,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWidget(message: Constants.phoneNo,
                    asset: Constants.whatsappLogo,
                    size: 25,
                    onTap: () {
                      launcher.launchUrl(Uri.parse(Constants.whatsappLink));
                    }),
                InkWidget(
                    asset: Constants.linkedinLogo,
                    size: 25,
                    onTap: () {
                      launcher.launchUrl(Uri.parse(Constants.linkedinLink));
                    }),
                InkWidget(message: Constants.phoneNo,
                    asset: Constants.phoneLogo,
                    size: 25,
                    onTap: () {
                      launcher.launchUrl(Uri.parse(Constants.phoneLink));
                    }),
                InkWidget(message: Constants.emailAddress,
                    asset: Constants.mailLogo,
                    size: 25,
                    onTap: () {
                      launcher.launchUrl(Uri.parse(Constants.gmailLink));
                    }),
                InkWidget(
                    asset: Constants.githubLogo,
                    size: 25,
                    onTap: () {
                      launcher.launchUrl(Uri.parse(Constants.githubLink));
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
