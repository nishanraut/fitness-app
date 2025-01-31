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
    apiKey: 'AIzaSyBu5Q_8VOgu8EQeDKmgT_xRDNPrcLIl62w',
    appId: '1:811471708960:web:07e85889c2ce5c5c976d45',
    messagingSenderId: '811471708960',
    projectId: 'fitroute-54b2d',
    authDomain: 'fitroute-54b2d.firebaseapp.com',
    storageBucket: 'fitroute-54b2d.firebasestorage.app',
    measurementId: 'G-8CK9EWVV8B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCo8EG_FMW5VqDVsdtKj2li4I7qnu2gicM',
    appId: '1:811471708960:android:94bdefaf3f5ff527976d45',
    messagingSenderId: '811471708960',
    projectId: 'fitroute-54b2d',
    storageBucket: 'fitroute-54b2d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkPyNQ_qjmn6gTOM5ZOXRR7h0GVPn2wrw',
    appId: '1:811471708960:ios:0613398478072c4a976d45',
    messagingSenderId: '811471708960',
    projectId: 'fitroute-54b2d',
    storageBucket: 'fitroute-54b2d.firebasestorage.app',
    iosBundleId: 'com.example.fitRoute',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkPyNQ_qjmn6gTOM5ZOXRR7h0GVPn2wrw',
    appId: '1:811471708960:ios:0613398478072c4a976d45',
    messagingSenderId: '811471708960',
    projectId: 'fitroute-54b2d',
    storageBucket: 'fitroute-54b2d.firebasestorage.app',
    iosBundleId: 'com.example.fitRoute',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBu5Q_8VOgu8EQeDKmgT_xRDNPrcLIl62w',
    appId: '1:811471708960:web:4498147820d24356976d45',
    messagingSenderId: '811471708960',
    projectId: 'fitroute-54b2d',
    authDomain: 'fitroute-54b2d.firebaseapp.com',
    storageBucket: 'fitroute-54b2d.firebasestorage.app',
    measurementId: 'G-G5N3G5PSXG',
  );
}
