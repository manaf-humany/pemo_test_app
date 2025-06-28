import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pemo_test_project/core/generated/assets.gen.dart';
import 'package:pemo_test_project/core/theme/theme_export.dart';
import 'package:pemo_test_project/core/widgets/app_texts.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({required this.title, this.content, super.key});
  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSpacing.x2,
        children: <Widget>[
          SizedBox(height: 200, child: Lottie.asset(Assets.lottie.noData)),
          AppText.headingLarge(title, align: TextAlign.center),
          AppText.bodyLarge(content ?? '', align: TextAlign.center),
        ],
      ),
    );
  }
}
