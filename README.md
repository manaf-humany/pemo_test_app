# Pemo Test Assignment App

This Flutter application is a technical assignment designed to showcase best practices in mobile application development, including a robust architecture, state management, local data persistence, and a clean user interface.

## Table of Contents
- [Architectural Decisions](#architectural-decisions)
- [Features Implemented](#features-implemented)
- [Setup Instructions](#setup-instructions)
- [Future Improvements](#future-improvements)
- [Shared UI Components](#shared-ui-components)
- [Using the Makefile](#using-the-makefile)
- [Technical Documentation](#technical-documentation)

## Architectural Decisions

The project is built upon a foundation of modern and scalable architectural patterns to ensure maintainability, testability, and separation of concerns.

- **Clean Architecture**: The codebase is strictly organized into three layers: Presentation, Domain, and Data. This separation ensures that business logic is independent of UI and data sources, making the app easier to test and maintain.
- **State Management**: We use **BLoC (Cubit)** for state management. Cubits provide a simple, predictable, and boilerplate-free way to manage the state of UI components, handling everything from user input to asynchronous data fetching.
- **Local Data Persistence**: **Hive** is used as the local database solution. It's a lightweight, fast, and native NoSQL database for Dart and Flutter, perfect for caching data and supporting offline functionality.
- **Form Handling**: For complex forms like card creation, the **`formz`** package is used. It provides a structured way to handle form inputs, validation, and submission states, keeping the UI and business logic clean.
- **Dependency Injection**: **`get_it`** is used as a service locator to provide easy access to repositories, use cases, and cubits throughout the application, decoupling classes from their concrete implementations.
- **Shared UI Components**: A local package `pemo_test_component` is used to store shared widgets and UI constants, promoting code reuse and a consistent design system across the app.

## Features Implemented

### 1. Manage Cards
A complete feature allowing users to create and view custom payment cards.
- **Card Creation**: A multi-step form guides the user through entering card details (Card Name, Cardholder, Balance, and Color). Each step includes validation.
- **Card Listing**: Displays a list of all created cards. The screen correctly handles loading, empty, and error states.
- **Local Storage**: All created cards are persisted locally using Hive.

### 2. View Transactions
- Displays a list of transactions and a transaction details fetched from a remote data source.
- The repository layer includes logic to cache transactions locally, providing a seamless offline experience.

### 3. Currency Conversion (Not requested)
- The application supports displaying amounts in different currencies.
- **Implementation Note**: For the sake of simplicity and in the absence of a live currency exchange API, the conversion is handled locally using a static table of exchange rates. This demonstrates the architectural capability to handle such a feature while keeping the implementation self-contained for this assignment.

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

## Future Improvements

While the current application is robust, here are some potential areas for future enhancement:

- **Remote API for Cards**: Implement a remote data source for the "Manage Cards" feature to sync cards with a server.
- **Live Currency Conversion**: Integrate a real-time currency exchange rate API (e.g., exchangeratesapi.io) to replace the static conversion table.
- **Enhanced UI/UX**: Add animations and micro-interactions to improve the user experience.
- **Comprehensive Widget & Integration Testing**: While unit tests are in place, adding more widget and integration tests would increase confidence in the UI and end-to-end flows.
- **CI/CD Pipeline**: Set up a Continuous Integration/Continuous Deployment pipeline (e.g., using GitHub Actions) to automate testing and builds.


### Shared UI Components

To see the ui components follow below steps:

- cd packages/pemo_test_component
- flutter run -d chrome

### Using the Makefile
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

## Technical Documentation

The technical documentation for this project, including detailed descriptions of classes, methods, and their purposes, can be generated and viewed locally.
This is achieved using `dartdoc`, the official Dart documentation generator.

To generate and view the documentation, run the following commands in your terminal from the root of the project:
   ```bash
      dart doc .
      dart pub global activate dhttpd
      dart pub global run dhttpd --path doc/api
   ```
