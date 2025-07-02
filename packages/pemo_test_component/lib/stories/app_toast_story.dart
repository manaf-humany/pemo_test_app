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

            final subtitle = context.knobs.text(
              label: 'Subtitle',
              initial: 'This is an optional subtitle.',
            );

            final withLeadingIcon = context.knobs.boolean(
              label: 'With Leading Icon',
              initial: true,
            );

            final withSubtitleIcon = context.knobs.boolean(
              label: 'With Subtitle Icon',
              initial: false,
            );

            final withCloseButton = context.knobs.boolean(
              label: 'With Close Button',
              initial: false,
            );

            return Scaffold(
              body: Center(
                child: AppMainButton(
                  title: 'Show Toast',
                  onTap: () {
                    AppToastWidget.show(
                      context: context,
                      title: title,
                      subtitle: subtitle,
                      leadingIcon: withLeadingIcon
                          ? AppSvgPicture.asset(
                              Assets.svgs.,
                            )
                          : null,
                      subtitleIcon: withSubtitleIcon
                          ? const AppSvgPicture.asset(
                              Assets.svgs.arrowRight,
                            )
                          : null,
                      closeIcon: withCloseButton
                          ? const AppSvgPicture.asset(Assets.svgs.xclose)
                          : null,
                      onTap: () {
                        // ignore: avoid_print
                        print('Toast tapped!');
                      },
                      onCloseToast: () {
                        // ignore: avoid_print
                        print('Toast closed!');
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
}
