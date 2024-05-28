import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/theme/theme_data.dart';

class NeumorphismButton extends StatelessWidget {
  final bool isPress;
  final void Function(PointerEnterEvent) onEnter;
  final dynamic Function(PointerExitEvent) onExit;
  final VoidCallback onTap;
  final double height, width;
  final Widget child;
  const NeumorphismButton({
    super.key,
    required this.isPress,
    required this.onEnter,
    required this.onExit,
    required this.onTap,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isPress
                ? [
                    const BoxShadow(
                      color: AppTheme.upperNeumorphismShade,
                      offset: Offset(-10.0, -10.0),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                    const BoxShadow(
                      color: AppTheme.lowerNeumorphismShade,
                      offset: Offset(10.0, 10.0),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ]
                : [
                    const BoxShadow(
                      color: AppTheme.upperNeumorphismShade,
                      offset: Offset(-0.1, -0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: AppTheme.lowerNeumorphismShade,
                      offset: Offset(0.1, 0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}



      // Container(
      //   width: 500.0,
      //   height: 500.0,
      //   color: Color(0xffecf0f3),
      //   alignment: Alignment.center,
      //   transformAlignment: Alignment.center,
      //   child: Container(
      //     color: Color(0xffecf0f3),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       child: Icon(
      //         Icons.star,
      //         size: 67,
      //         color: Colors.amber,
      //       ),
      //       decoration: BoxDecoration(
      //         color: Color(0xffecf0f3),
      //         borderRadius: BorderRadius.circular(10),
      //         gradient: LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           colors: [
      //             Color(0xffecf0f3),
      //             Color(0xffecf0f3),
      //           ],
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Color(0xffffffff),
      //             offset: Offset(-20.0, -20.0),
      //             blurRadius: 30,
      //             spreadRadius: 0.0,
      //           ),
      //           BoxShadow(
      //             color: Color(0xffced2d5),
      //             offset: Offset(20.0, 20.0),
      //             blurRadius: 30,
      //             spreadRadius: 0.0,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // )
  