// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBSt46UUyirlI8AK-3dED-wM5dUYg2oqWg',
    appId: '1:283639121413:web:0219fdadca4d814581be6c',
    messagingSenderId: '283639121413',
    projectId: 'project-management-app-578c6',
    authDomain: 'project-management-app-578c6.firebaseapp.com',
    storageBucket: 'project-management-app-578c6.appspot.com',
    measurementId: 'G-N0TKY5TLGQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBvokRGl6DtZtjW1DZZfnQs5yXtaLX5bA',
    appId: '1:283639121413:android:bc3224b53bc40e7881be6c',
    messagingSenderId: '283639121413',
    projectId: 'project-management-app-578c6',
    storageBucket: 'project-management-app-578c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3XqKtndmjJAHhWZyCavV4u-2SigbSupc',
    appId: '1:283639121413:ios:d646a879d7b2e0d181be6c',
    messagingSenderId: '283639121413',
    projectId: 'project-management-app-578c6',
    storageBucket: 'project-management-app-578c6.appspot.com',
    iosBundleId: 'com.example.projectManagementApp',
  );

}