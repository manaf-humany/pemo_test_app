import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A story to showcase the [AppPrimaryAppBar] widget.
class AppPrimaryAppBarStory extends Story {
  AppPrimaryAppBarStory()
      : super(
          name: 'Widgets/AppPrimaryAppBar',
          builder: (context) {
            return Scaffold(
              appBar: AppPrimaryAppBar(
                title: context.knobs.text(label: 'Title', initial: 'My App'),
                centerTitle:
                    context.knobs.boolean(label: 'Center Title', initial: true),
                elevation: context.knobs
                    .slider(label: 'Elevation', initial: 0, min: 0, max: 20),
                backgroundColor: context.knobs.options(
                    label: 'Background Color',
                    options: [
                      Option(
                          label: 'Primary',
                          value: AppTheme.of(context).color.primaryColor),
                      Option(
                          label: 'Secondary',
                          value: AppTheme.of(context).color.secondaryColor),
                      Option(
                          label: 'Success',
                          value: AppTheme.of(context).color.greenColor),
                      Option(
                          label: 'Error',
                          value: AppTheme.of(context).color.errorColor),
                    ],
                    initial: AppTheme.of(context).color.primaryColor),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              body: const Center(
                child: AppText.bodyLarge('This is the body of the scaffold.'),
              ),
            );
          },
        );
}
