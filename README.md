# Flutter App

This is a Flutter application that includes various components, helper functions, and pages for authentication and user interaction.

# Getting Started
To get started with this project, follow the instructions below.

## Prerequisites
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK
- IDE (VSCode, Android Studio, etc.)
- A connected device or emulator for testing

## Installation

Clone this repository:

```bash
git clone <repository-url>
cd <repository-directory>
```

Install Dependencies:
```bash
flutter pub get
```
Run the app on your connected device or emulator:
```bash
flutter run
```

# Project Structure Overview

## Components
- button.dart: Contains the reusable button widget.
- drawer.dart: Custom drawer widget for navigation.
- textfield.dart: A styled text field component used across the app.
- wall_post.dart: Widget that displays posts or content in a "wall" style.

## Helper
- helper_function.dart: This file contains utility functions used throughout the app to assist with common tasks like form validation, UI interaction, etc.

## Pages
- home_page.dart: The main landing page for the app after successful login.
- login.dart: The login page for user authentication.
- settings_page.dart: A page for user settings and preferences.
- signup.dart: The sign-up page for new users.

## Services
- auth.dart: Handles the core authentication logic such as sign in and sign out.
- login_register.dart: Manages the login and registration services, possibly integrated with Firebase or another backend.

## Firebase
- Firebase has been integrated into the app to manage authentication and backend services, such as login and registration.


## Running Tests
- To run unit tests, use the following command:
  ```bash
  flutter test
  ```

##Building for Release

1-For Android:
  ```bash
  flutter build apk
  ```

1-For Ios:
  ```bash
  flutter build ios
  ```



