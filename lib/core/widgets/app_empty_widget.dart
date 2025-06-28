import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemo_test_project/core/core.dart';

class AppEmptyPage extends StatelessWidget {
  const AppEmptyPage({
    required this.title,
    this.content,
    this.image,
    super.key,
  });
  final String title;
  final String? content;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child:
                image != null
                    ? Image.asset(image!)
                    : Lottie.asset(Assets.lottie.noData),
          ),
          AppSpacing.h6,
          AppText.headingLarge(title, align: TextAlign.center),
          if (content != null) ...[
            AppSpacing.h2,
            AppText.bodyLarge(content!, align: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
