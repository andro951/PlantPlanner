// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

Future loginOneSignal(String userId) async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  const String onesignalApiKey =
      'os_v2_app_nsbhvlza2jhalb5lj44ohpux3v6eb2mn62muviffexj3y5ikapnr6hl6nq2v24pvax7ka5cxo3ks4jgwuqt3zxlzvdskuxt32ugafty';
  const String onesignalAppId = '6c827aaf-20d2-4e05-87ab-4f38e3be97dd';

  final Uri url = Uri.parse('https://onesignal.com/api/v1/players');

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Basic $onesignalApiKey',
    },
    body: jsonEncode({
      'app_id': onesignalAppId,
      'external_user_id': userId,
    }),
  );

  //OneSignal.login(userId);
}
