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
    apiKey: 'AIzaSyD31adHYZGPlaCt4Sa6K-tXNfn5La_cq2k',
    appId: '1:1048256696626:web:d58483241231d972b6072b',
    messagingSenderId: '1048256696626',
    projectId: 'todo-cf4f7',
    authDomain: 'todo-cf4f7.firebaseapp.com',
    storageBucket: 'todo-cf4f7.appspot.com',
    measurementId: 'G-P21M9W4T1H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnUKsbrap6WufHtWjyKX8JG-k8IxPrblY',
    appId: '1:1048256696626:android:1a3b8eb69c66b601b6072b',
    messagingSenderId: '1048256696626',
    projectId: 'todo-cf4f7',
    storageBucket: 'todo-cf4f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpGR-WPffnVVfj5Sh-6meo7T__08Y_b7g',
    appId: '1:1048256696626:ios:f1b4807eb63f0ca6b6072b',
    messagingSenderId: '1048256696626',
    projectId: 'todo-cf4f7',
    storageBucket: 'todo-cf4f7.appspot.com',
    iosClientId:
        '1048256696626-4gg1madtl2okap078ublikhi86ok9cp0.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpGR-WPffnVVfj5Sh-6meo7T__08Y_b7g',
    appId: '1:1048256696626:ios:f1b4807eb63f0ca6b6072b',
    messagingSenderId: '1048256696626',
    projectId: 'todo-cf4f7',
    storageBucket: 'todo-cf4f7.appspot.com',
    iosClientId:
        '1048256696626-4gg1madtl2okap078ublikhi86ok9cp0.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
