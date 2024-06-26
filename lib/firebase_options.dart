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
    apiKey: 'AIzaSyBF_53Ilnfpc68WX5IVwhGH6flmuWFbbCs',
    appId: '1:777162769410:web:a8622e31c082776183531b',
    messagingSenderId: '777162769410',
    projectId: 'projecteleos',
    authDomain: 'projecteleos.firebaseapp.com',
    databaseURL: 'https://projecteleos-default-rtdb.firebaseio.com',
    storageBucket: 'projecteleos.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATsBwGaWlWp4qQ6KMEC3tmCxtQBBCxkY0',
    appId: '1:777162769410:android:a999578cfc8c2d5983531b',
    messagingSenderId: '777162769410',
    projectId: 'projecteleos',
    databaseURL: 'https://projecteleos-default-rtdb.firebaseio.com',
    storageBucket: 'projecteleos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC144NKIRcskCcig5MjlFZTSuPuAENp4-4',
    appId: '1:777162769410:ios:338e132b3f7da2ba83531b',
    messagingSenderId: '777162769410',
    projectId: 'projecteleos',
    databaseURL: 'https://projecteleos-default-rtdb.firebaseio.com',
    storageBucket: 'projecteleos.appspot.com',
    iosClientId: '777162769410-rgkre4r17mkbcivkuhsdqsvjmt7iq7n4.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC144NKIRcskCcig5MjlFZTSuPuAENp4-4',
    appId: '1:777162769410:ios:338e132b3f7da2ba83531b',
    messagingSenderId: '777162769410',
    projectId: 'projecteleos',
    databaseURL: 'https://projecteleos-default-rtdb.firebaseio.com',
    storageBucket: 'projecteleos.appspot.com',
    iosClientId: '777162769410-rgkre4r17mkbcivkuhsdqsvjmt7iq7n4.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleproject',
  );
}
