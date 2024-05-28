import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/theme_data.dart';
import 'package:my_portfolio/utils/constants.dart';

class ProfileImage extends StatefulWidget {
  final double size;
  const ProfileImage({super.key, required this.size});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    _animation = Tween(begin: const Offset(0, 0.05), end: const Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppTheme.upperNeumorphismShade,
              offset: Offset(-10, -10),
              blurRadius: 30,
              spreadRadius: 10,
            ),
            BoxShadow(
              color: AppTheme.lowerNeumorphismShade,
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 10,
            ),
          ],
        ),
        height: widget.size,
        child: AspectRatio(
            aspectRatio: 0.639,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Constants.profileImage,
                fit: BoxFit.fill,
              ),
            )),
      ),
    );
  }
}
