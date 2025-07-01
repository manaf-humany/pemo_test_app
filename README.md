# Pemo Test Assignment App

### Setup Instructions

1. Download and install [Flutter SDK](https://docs.flutter.dev/get-started/install)
2. Download and install IDE
3. Open the project
4. Run the following commands:
   ```bash
   # Install dependencies for main app and all packages
   make get

   # Generate required code files
   make genFiles

   # Format code
   make format
   ```

5. Select a target device (emulator or real device). See guides for:
   - [Flutter device setup](https://docs.flutter.dev/get-started/test-drive)
   - [Android emulator setup](https://developer.android.com/studio/run/managing-avds)

6. To run the project:
   ```bash
   flutter run -t lib/main.dart
   ```

### Development Commands

- `make get` - Install dependencies for main app and all packages
- `make upgrade` - Upgrade dependencies for main app and all packages
- `make lint` - Run static analysis
- `make format` - Format code for main app and all packages
- `make testing` - Run tests for main app and all packages
- `make test-coverage` - Run tests with coverage for main app and all packages
- `make clean` - Clean build artifacts for main app and all packages
- `make genFiles` - Generate code using build_runner for main app and specified packages
- `make genFiles-watch` - Generate code in watch mode for main app and specified packages
- `make pods-clean` - Clean iOS pod files and Flutter framework
- `make build-runner` - Run build_runner for specified packages only

### Architecture

Following principles are followed:

- MVVM pattern for screens
- Injection pattern for dependencies and instantiation
- SOLID principles
- Latest Flutter coding style, conventions and lints.


### Testing

`flutter test`

### UI Components

To see the ui components follow below steps:

- cd packages/pemo_test_component
- flutter run -d chrome
