import 'package:flutter/material.dart';
import 'package:my_portfolio/appbar/desktop_appbar.dart';
import 'package:my_portfolio/appbar/large_tablet_appbar.dart';
import 'package:my_portfolio/appbar/mobile_appbar.dart';
import 'package:my_portfolio/appbar/small_tablet_appbar.dart';
import 'package:my_portfolio/drawer/drawer.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();

  void scrollToIndex(int index) => WidgetsBinding.instance.addPostFrameCallback(
      (_) => itemScrollController.scrollTo(
          index: index,
          duration: const Duration(seconds: 2),
          curve: Curves.fastLinearToSlowEaseIn));

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWidget(
        onTap1: () {
          scrollToIndex(0);
        },
        onTap2: () {
          scrollToIndex(1);
        },
        onTap3: () {
          scrollToIndex(2);
        },
        onTap4: () {
          scrollToIndex(3);
        },
      ),
      appBar: width < 500
          ? mobileAppBar()
          : width < 800
              ? smallTabletAppBar()
              : width < 1100
                  ? largeTabletAppBar(
                      onTap1: () {
                        scrollToIndex(0);
                      },
                      onTap2: () {
                        scrollToIndex(1);
                      },
                      onTap3: () {
                        scrollToIndex(2);
                      },
                      onTap4: () {
                        scrollToIndex(3);
                      },
                    )
                  : desktopAppBar(
                      onTap1: () {
                        scrollToIndex(0);
                      },
                      onTap2: () {
                        scrollToIndex(1);
                      },
                      onTap3: () {
                        scrollToIndex(2);
                      },
                      onTap4: () {
                        scrollToIndex(3);
                      },
                    ),
      body: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemCount: Constants.homeMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return Constants.homeMenu[index];
        },
      ),
    );
  }
}
