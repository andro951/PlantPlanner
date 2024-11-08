import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD_tlH6KfKJxMu5EYwrm-xsK2N9j2dWu80",
            authDomain: "plant-planner-ogpnap.firebaseapp.com",
            projectId: "plant-planner-ogpnap",
            storageBucket: "plant-planner-ogpnap.appspot.com",
            messagingSenderId: "83527110089",
            appId: "1:83527110089:web:2db2cecd8bcbab5a2a6c18",
            measurementId: "G-B1HZD4MQJG"));
  } else {
    await Firebase.initializeApp();
  }
}
