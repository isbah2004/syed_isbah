import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/theme_data.dart';

class ProjectOverviewer extends StatelessWidget {
  final String title, image;
  final double sizedBoxHeight, sizedBoxWidth;
  final VoidCallback onTap;
  const ProjectOverviewer(
      {super.key,
      required this.title,
      required this.image,
      required this.sizedBoxHeight,
      required this.sizedBoxWidth,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          height: sizedBoxHeight,
          width: sizedBoxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  title,
                  style: AppTheme.font25Bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
