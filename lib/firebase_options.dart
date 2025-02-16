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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAL1umYSSYXwvWNkdvAQt_LHzy-dmLZ8bw',
    appId: '1:726762192331:android:1549633085f6c090038a4e',
    messagingSenderId: '726762192331',
    projectId: 'joball-7199a',
    storageBucket: 'joball-7199a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVYgskYlj4Ecle5yAJT1o7xlNmBJNtXPo',
    appId: '1:726762192331:ios:8f8f1c5da4c1530f038a4e',
    messagingSenderId: '726762192331',
    projectId: 'joball-7199a',
    storageBucket: 'joball-7199a.firebasestorage.app',
    iosBundleId: 'com.example.flutterSampleOne',
  );

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyDsr-dS1guFtxtiNVs7jpBNFZWZb9RjrP0",
      authDomain: "joball-7199a.firebaseapp.com",
      projectId: "joball-7199a",
      storageBucket: "joball-7199a.firebasestorage.app",
      messagingSenderId: "726762192331",
      appId: "1:726762192331:web:ab9ad90325d7d5da038a4e",
      measurementId: "G-H4LPCB19W8"
  );
}
