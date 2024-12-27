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
    apiKey: 'AIzaSyDsNJ9qsHCz58vlQvvIl-oVWnmS5M892EM',
    appId: '1:105528374175:web:26ad7e675daafa467283aa',
    messagingSenderId: '105528374175',
    projectId: 'chats-48538',
    authDomain: 'chats-48538.firebaseapp.com',
    storageBucket: 'chats-48538.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9u-2_rAxxFvpuQbL8TMwl8e7gCza1emw',
    appId: '1:105528374175:android:5ba0e03834d4e7017283aa',
    messagingSenderId: '105528374175',
    projectId: 'chats-48538',
    storageBucket: 'chats-48538.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVVqyGwPWNAudlYULGfSPK9g5MrMl51vo',
    appId: '1:105528374175:ios:d38f44afb95a08417283aa',
    messagingSenderId: '105528374175',
    projectId: 'chats-48538',
    storageBucket: 'chats-48538.firebasestorage.app',
    iosClientId: '105528374175-p2ohtnp5bp1d9e0d520e85ru3q6mhhmv.apps.googleusercontent.com',
    iosBundleId: 'com.example.chats',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVVqyGwPWNAudlYULGfSPK9g5MrMl51vo',
    appId: '1:105528374175:ios:d38f44afb95a08417283aa',
    messagingSenderId: '105528374175',
    projectId: 'chats-48538',
    storageBucket: 'chats-48538.firebasestorage.app',
    iosClientId: '105528374175-p2ohtnp5bp1d9e0d520e85ru3q6mhhmv.apps.googleusercontent.com',
    iosBundleId: 'com.example.chats',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDsNJ9qsHCz58vlQvvIl-oVWnmS5M892EM',
    appId: '1:105528374175:web:257b6e8d35ce0b9f7283aa',
    messagingSenderId: '105528374175',
    projectId: 'chats-48538',
    authDomain: 'chats-48538.firebaseapp.com',
    storageBucket: 'chats-48538.firebasestorage.app',
  );
}