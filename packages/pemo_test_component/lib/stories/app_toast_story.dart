import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AppToastStory extends Story {
  AppToastStory()
      : super(
          name: 'Widgets/AppToast',
          builder: (context) {
            final title = context.knobs.text(
              label: 'Title',
              initial: 'This is a toast message!',
            );

            return Scaffold(
              body: Center(
                child: Column(
                  spacing: 24,
                  children: [
                    AppMainButton(
                      title: 'Show success toast',
                      onTap: () {
                        AppToastWidget.showSuccessToast(
                          context: context,
                          message: title,
                        );
                      },
                    ),
                    AppMainButton(
                      title: 'Show error toast',
                      onTap: () {
                        AppToastWidget.showErrorToast(
                          context: context,
                          message: title,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
}
