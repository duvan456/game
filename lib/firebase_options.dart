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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyARwfnqO8h_jRS7m8j7uGCN9YHWSrwZwSs',
    appId: '1:861303399493:web:412b503106935b074a6f2c',
    messagingSenderId: '861303399493',
    projectId: 'game-96067',
    authDomain: 'game-96067.firebaseapp.com',
    storageBucket: 'game-96067.appspot.com',
    measurementId: 'G-DTL3T4YNP1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4OA5pQNNpJkZGysvtfYkIMfV6tdpYVu0',
    appId: '1:861303399493:android:7e2a3d2b57b3fef84a6f2c',
    messagingSenderId: '861303399493',
    projectId: 'game-96067',
    storageBucket: 'game-96067.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZp5IXm5KV2_SwGT4VuLft8hPbuU9sMGw',
    appId: '1:861303399493:ios:a65e18583b3c973d4a6f2c',
    messagingSenderId: '861303399493',
    projectId: 'game-96067',
    storageBucket: 'game-96067.appspot.com',
    iosBundleId: 'com.example.game',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZp5IXm5KV2_SwGT4VuLft8hPbuU9sMGw',
    appId: '1:861303399493:ios:a65e18583b3c973d4a6f2c',
    messagingSenderId: '861303399493',
    projectId: 'game-96067',
    storageBucket: 'game-96067.appspot.com',
    iosBundleId: 'com.example.game',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARwfnqO8h_jRS7m8j7uGCN9YHWSrwZwSs',
    appId: '1:861303399493:web:755bd607711b238c4a6f2c',
    messagingSenderId: '861303399493',
    projectId: 'game-96067',
    authDomain: 'game-96067.firebaseapp.com',
    storageBucket: 'game-96067.appspot.com',
    measurementId: 'G-S3CH17SM9M',
  );
}