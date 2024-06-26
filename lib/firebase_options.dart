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
    apiKey: 'AIzaSyBJjq2gOJSrMQ0U944_2pCLLzJ1z5cglu8',
    appId: '1:1010784892619:web:3143c7bfcd9534e2e54d4e',
    messagingSenderId: '1010784892619',
    projectId: 'bynryapp-659e4',
    authDomain: 'bynryapp-659e4.firebaseapp.com',
    storageBucket: 'bynryapp-659e4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBR11qVY1eTU6n3O2cAmsYZ24_1OmJnogc',
    appId: '1:1010784892619:android:e2022d67d7f17bade54d4e',
    messagingSenderId: '1010784892619',
    projectId: 'bynryapp-659e4',
    storageBucket: 'bynryapp-659e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7_gtEjLfzNwCc8uLAuStsMeSGt_PGl0s',
    appId: '1:1010784892619:ios:5fb064050b307a83e54d4e',
    messagingSenderId: '1010784892619',
    projectId: 'bynryapp-659e4',
    storageBucket: 'bynryapp-659e4.appspot.com',
    iosBundleId: 'com.example.bynryapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7_gtEjLfzNwCc8uLAuStsMeSGt_PGl0s',
    appId: '1:1010784892619:ios:5fb064050b307a83e54d4e',
    messagingSenderId: '1010784892619',
    projectId: 'bynryapp-659e4',
    storageBucket: 'bynryapp-659e4.appspot.com',
    iosBundleId: 'com.example.bynryapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJjq2gOJSrMQ0U944_2pCLLzJ1z5cglu8',
    appId: '1:1010784892619:web:92a0773ed8970520e54d4e',
    messagingSenderId: '1010784892619',
    projectId: 'bynryapp-659e4',
    authDomain: 'bynryapp-659e4.firebaseapp.com',
    storageBucket: 'bynryapp-659e4.appspot.com',
  );
}
