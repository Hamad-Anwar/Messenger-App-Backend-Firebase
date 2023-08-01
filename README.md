# Flutter Messenger Application


## Description
Welcome to our innovative Flutter chat application! This feature-rich messaging platform allows users to connect and communicate seamlessly through text and images. The app is built using Flutter for the frontend and integrates with Firebase for backend services, including authentication, real-time database, and storage.

## Features
- User-friendly interface for an intuitive chatting experience.
- Firebase authentication with OTP verification for secure sign-ins.
- Real-time messaging using Firebase Realtime Database for instant message delivery.
- Firebase Storage integration for sharing images.
- Supports both Android and iOS platforms.

## Demo

<img src=demo.png/>

## Setup Instructions
To use this project, follow these steps:

1. Clone the repository to your local machine:
Replace `https://github.com/Hamad-Anwar/Messenger-App-Backend-Firebase` with the URL of this GitHub repository.

2. Set up Firebase:
- Create a new Firebase project in the [Firebase Console](https://console.firebase.google.com/).
- Enable Firebase Authentication with OTP verification, Firebase Realtime Database, and Firebase Storage for your project.
- Download the `google-services.json` file from Firebase and place it in the `android/app/` directory of this Flutter project.

3. Install Flutter:
Ensure you have Flutter installed on your machine. If not, follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install) to set it up.

4. Get Dependencies:
Run the following command in the project directory to fetch all the required dependencies:

5. Connect to Firebase:
Open the `android/app/build.gradle` file and ensure that the Firebase dependencies and configuration are correctly set up.

6. Run the App:
Connect a physical device or use an emulator, then run the app using the following command:

7. Test the App:
Verify that Firebase authentication, OTP verification, real-time database, and image storage are working as intended. Test the app's functionalities by sending and receiving messages and images.
## Dependencies
The following packages were used to develop this app:

- [get: ^4.6.5](https://pub.dev/packages/get): A state management library for Flutter that simplifies the process of managing app states.
- [image_picker: ^1.0.1](https://pub.dev/packages/image_picker): Allows users to pick images and videos from the device's gallery or camera.
- [firebase_core: ^2.4.1](https://pub.dev/packages/firebase_core): Provides Firebase core functionality and initialization for Flutter apps.
- [firebase_storage: ^11.0.10](https://pub.dev/packages/firebase_storage): A Flutter plugin to use Firebase Cloud Storage, which allows uploading and downloading files.
- [firebase_auth: ^4.2.5](https://pub.dev/packages/firebase_auth): A Flutter plugin to use Firebase Authentication, enabling easy user authentication.
- [cloud_firestore: ^4.3.1](https://pub.dev/packages/cloud_firestore): A Flutter plugin to use Firebase Cloud Firestore, a NoSQL cloud database for storing and syncing data.
- [firebase_database: ^10.0.9](https://pub.dev/packages/firebase_database): A Flutter plugin to use Firebase Realtime Database, which provides a cloud-hosted NoSQL database.
- [shared_preferences: ^2.2.0](https://pub.dev/packages/shared_preferences): A Flutter plugin to persist key-value data on the device.
- [path_provider: ^2.0.15](https://pub.dev/packages/path_provider): Provides access to directories on the device's file system.
- [animated_bottom_navigation_bar: ^1.2.0](https://pub.dev/packages/animated_bottom_navigation_bar): A customizable animated bottom navigation bar for Flutter.
- [photo_view: ^0.14.0](https://pub.dev/packages/photo_view): Provides zoomable photo viewing capabilities for Flutter.
- [cached_network_image: ^3.2.3](https://pub.dev/packages/cached_network_image): Caches network images to improve performance when loading images from the internet.
- [dio: ^5.3.0](https://pub.dev/packages/dio): A powerful HTTP client for Dart, which supports RESTful APIs, FormData, and more.
- [intl: ^0.18.1](https://pub.dev/packages/intl): Provides internationalization and localization support for Flutter apps.

Make sure to add these dependencies to your `pubspec.yaml` file before running the app.

## Customization
Feel free to customize the app's UI, themes, and other features according to your preferences and needs. You can modify the source code to add new features or improve existing ones.

## Troubleshooting
If you encounter any issues, check the project's documentation or refer to the [GitHub repository] for existing issues and solutions. You can also raise new issues on the repository if you need further assistance.

