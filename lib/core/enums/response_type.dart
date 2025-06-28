import 'package:pemo_test_project/core/generated/assets.gen.dart';

enum ResponseType {
  success,
  validationError,
  serverError,
  networkError,
  clientError,
  notFound,
  generalError,
}

extension ResponseTypeExtension on ResponseType {
  String get title {
    switch (this) {
      case ResponseType.serverError:
        return 'Server Error';
      case ResponseType.networkError:
        return 'No Internet Connection';
      case ResponseType.generalError:
        return 'Oops! Something Went Wrong';
      case ResponseType.notFound:
      case ResponseType.clientError:
      case ResponseType.success:
      case ResponseType.validationError:
        return '';
    }
  }

  String get subTitle {
    switch (this) {
      case ResponseType.serverError:
        return 'We’re having trouble connecting to our servers. Please try again later.';
      case ResponseType.networkError:
        return 'Please check your network settings and try again.';
      case ResponseType.generalError:
        return 'We encountered an unexpected issue. Please try again. If the problem persists, contact our support team for assistance.';
      case ResponseType.notFound:
      case ResponseType.clientError:
      case ResponseType.success:
      case ResponseType.validationError:
        return '';
    }
  }

  String? get image {
    switch (this) {
      case ResponseType.serverError:
        return Assets.images.serverErrorIcon.path;
      case ResponseType.networkError:
        return Assets.images.noInternetErrorIcon.path;
      case ResponseType.generalError:
        return Assets.images.generalErrorIcon.path;
      case ResponseType.notFound:
      case ResponseType.clientError:
      case ResponseType.success:
      case ResponseType.validationError:
        return null;
    }
  }
}
