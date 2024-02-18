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
    apiKey: 'AIzaSyB_US4Nwc8OnSRd0jASRfn-RVW1HZBaw6g',
    appId: '1:827195851413:web:4b89198e001f61d2abd19c',
    messagingSenderId: '827195851413',
    projectId: 'uasmobile2-5e3d3',
    authDomain: 'uasmobile2-5e3d3.firebaseapp.com',
    storageBucket: 'uasmobile2-5e3d3.appspot.com',
    measurementId: 'G-7RRJ8XZZCV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAy3CbdEcviCfChuyVfZizkcjBszdzWgY',
    appId: '1:827195851413:android:77208b7ea831ba1dabd19c',
    messagingSenderId: '827195851413',
    projectId: 'uasmobile2-5e3d3',
    storageBucket: 'uasmobile2-5e3d3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAroj6SmfplS6yxYSrwyiGKZLptWwnQOF4',
    appId: '1:827195851413:ios:ab32b081ec9aa902abd19c',
    messagingSenderId: '827195851413',
    projectId: 'uasmobile2-5e3d3',
    storageBucket: 'uasmobile2-5e3d3.appspot.com',
    iosBundleId: 'com.example.uasMobile2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAroj6SmfplS6yxYSrwyiGKZLptWwnQOF4',
    appId: '1:827195851413:ios:1097a1a2a209d87eabd19c',
    messagingSenderId: '827195851413',
    projectId: 'uasmobile2-5e3d3',
    storageBucket: 'uasmobile2-5e3d3.appspot.com',
    iosBundleId: 'com.example.uasMobile2.RunnerTests',
  );
}
