import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCK5Wn4dsAa07I3N9oyUoL-UM1Byn-YPuQ',
    appId: '1:813985966888:web:4315c1b8104c6b4176fe1d',
    messagingSenderId: '813985966888',
    projectId: 'tasks-670b0',
    authDomain: 'tasks-670b0.firebaseapp.com',
    storageBucket: 'tasks-670b0.firebasestorage.app',
    measurementId: 'G-ZDHWHJYSL1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7SLOcK_ZZuv-igj_w77hBW7rrSi6X8iM',
    appId: '1:813985966888:android:ed3304d04e8d918476fe1d',
    messagingSenderId: '813985966888',
    projectId: 'tasks-670b0',
    storageBucket: 'tasks-670b0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBunMafaf0Tf4D27dpKi6BTiqL2Nc-zLX8',
    appId: '1:813985966888:ios:0f5f7e0a19229a1f76fe1d',
    messagingSenderId: '813985966888',
    projectId: 'tasks-670b0',
    storageBucket: 'tasks-670b0.firebasestorage.app',
    iosBundleId: 'com.example.appLucyana',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCK5Wn4dsAa07I3N9oyUoL-UM1Byn-YPuQ',
    appId: '1:813985966888:web:09e88bc39be2461376fe1d',
    messagingSenderId: '813985966888',
    projectId: 'tasks-670b0',
    authDomain: 'tasks-670b0.firebaseapp.com',
    storageBucket: 'tasks-670b0.firebasestorage.app',
    measurementId: 'G-457SXD3WVG',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBunMafaf0Tf4D27dpKi6BTiqL2Nc-zLX8',
    appId: '1:813985966888:ios:0f5f7e0a19229a1f76fe1d',
    messagingSenderId: '813985966888',
    projectId: 'tasks-670b0',
    storageBucket: 'tasks-670b0.firebasestorage.app',
    iosBundleId: 'com.example.appLucyana',
  );
}
