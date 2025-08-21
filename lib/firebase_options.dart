import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTQdC_AoeSN29LsSP0dd5iz2mWjT_N3WY',
    appId: '1:932410584345:android:bcd7e534e1bb63b3d62988',
    messagingSenderId: '932410584345',
    projectId: 'match-scores-demo',
    storageBucket: 'match-scores-demo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '***',
    appId: '1:932410584345:ios:089a54bdf75f0311d62988',
    messagingSenderId: '932410584345',
    projectId: 'match-scores-demo',
    storageBucket: 'match-scores-demo.firebasestorage.app',
    iosBundleId: 'com.irfan.matchscores',
  );
}
