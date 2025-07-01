import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

/// A storybook story for the [AppSkeletonLoadingWidget].
class AppSkeletonLoadingWidgetStory extends Story {
  /// Creates an [AppSkeletonLoadingWidgetStory].
  AppSkeletonLoadingWidgetStory()
      : super(
          name: 'Widgets/AppSkeletonLoadingWidget',
          builder: (context) {
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initial: true,
            );

            return Scaffold(
              appBar: AppBar(title: const Text('Skeleton Loading')),
              body: AppSkeletonLoadingWidget(
                enabled: enabled,
                child: ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.x4),
                  itemCount: 5,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.x4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            AppTheme.of(context).color.primaryColor,
                        child: const Icon(Icons.image, color: Colors.white),
                      ),
                      title: const Text('Placeholder Title'),
                      subtitle: const Text('Some subtitle text here.'),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
