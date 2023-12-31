// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDTBQrFQaFIwZqtTHmGnhfk6RQFSrpKc2E',
    appId: '1:368117423745:web:df377d8b97fe64c41eb780',
    messagingSenderId: '368117423745',
    projectId: 'smit-firebase-practice-2',
    authDomain: 'smit-firebase-practice-2.firebaseapp.com',
    storageBucket: 'smit-firebase-practice-2.appspot.com',
    measurementId: 'G-SH0VPLN55Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmnXY74gY70JrlnAcYDofq66TmYr0dFoA',
    appId: '1:368117423745:android:3685a1c282fa7b1b1eb780',
    messagingSenderId: '368117423745',
    projectId: 'smit-firebase-practice-2',
    storageBucket: 'smit-firebase-practice-2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrJC4_yB4drttx7qw-2nsDRGvFraG1t-I',
    appId: '1:368117423745:ios:3304d970f54674bb1eb780',
    messagingSenderId: '368117423745',
    projectId: 'smit-firebase-practice-2',
    storageBucket: 'smit-firebase-practice-2.appspot.com',
    iosBundleId: 'com.example.firebaseSmitFlutter',
  );
}
