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
    apiKey: 'AIzaSyA-7OWhADTjgP21RGR7QHfZW8iuDv2YTf0',
    appId: '1:949829014855:web:afa814090ae6df76806862',
    messagingSenderId: '949829014855',
    projectId: 'tiktok-414',
    authDomain: 'tiktok-414.firebaseapp.com',
    storageBucket: 'tiktok-414.appspot.com',
    measurementId: 'G-WZ40RL5ENE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBstlgxQlFRjv2twxHgmxFf1svopvtILmA',
    appId: '1:949829014855:android:d8e7ec84c5aaff8f806862',
    messagingSenderId: '949829014855',
    projectId: 'tiktok-414',
    storageBucket: 'tiktok-414.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXBC_hP-L1clcX1MA94D3erhLu7rfYZZE',
    appId: '1:949829014855:ios:e7e77ca2eae89091806862',
    messagingSenderId: '949829014855',
    projectId: 'tiktok-414',
    storageBucket: 'tiktok-414.appspot.com',
    iosClientId: '949829014855-p30aevn8k6iqvl9qpa7bn7q86roe8amk.apps.googleusercontent.com',
    iosBundleId: 'com.example.tiktokClone',
  );
}
