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
        return macos;
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
    apiKey: 'AIzaSyAneAWnfTeQ-sfTzdQRAYD2J8zk8RtlK0M',
    appId: '1:673463292336:web:86aa6f3d3673376f43c675',
    messagingSenderId: '673463292336',
    projectId: 'task-learn-a944a',
    authDomain: 'task-learn-a944a.firebaseapp.com',
    databaseURL: 'https://task-learn-a944a-default-rtdb.firebaseio.com',
    storageBucket: 'task-learn-a944a.appspot.com',
    measurementId: 'G-7BETZCYWP7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyW2ANjvnJv5ONNi5TnlmOyo8VwA6be7E',
    appId: '1:673463292336:android:94575c55dfae79b643c675',
    messagingSenderId: '673463292336',
    projectId: 'task-learn-a944a',
    databaseURL: 'https://task-learn-a944a-default-rtdb.firebaseio.com',
    storageBucket: 'task-learn-a944a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzIknTc7MR89hE0vbbXgWqJtF2DQCESSY',
    appId: '1:673463292336:ios:77687a074e58a26843c675',
    messagingSenderId: '673463292336',
    projectId: 'task-learn-a944a',
    databaseURL: 'https://task-learn-a944a-default-rtdb.firebaseio.com',
    storageBucket: 'task-learn-a944a.appspot.com',
    iosClientId:
        '673463292336-4aso0htfqn0nfl4bcdui6l8ghokmkkql.apps.googleusercontent.com',
    iosBundleId: 'com.example.kelompok4TaskLearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzIknTc7MR89hE0vbbXgWqJtF2DQCESSY',
    appId: '1:673463292336:ios:77687a074e58a26843c675',
    messagingSenderId: '673463292336',
    projectId: 'task-learn-a944a',
    databaseURL: 'https://task-learn-a944a-default-rtdb.firebaseio.com',
    storageBucket: 'task-learn-a944a.appspot.com',
    iosClientId:
        '673463292336-4aso0htfqn0nfl4bcdui6l8ghokmkkql.apps.googleusercontent.com',
    iosBundleId: 'com.example.kelompok4TaskLearn',
  );
}
