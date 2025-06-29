enum AssetPackageType {
  root, // Maps project from where the app is run (pemo_test_component app / Storybook)
  componentsLibrary; // Maps the components library from pemo_test_ app
}

extension AssetPackageTypeExtension on AssetPackageType {
  String? get name {
    switch (this) {
      case AssetPackageType.root:
        return null;
      case AssetPackageType.componentsLibrary:
        return 'pemo_test_component';
    }
  }
}
