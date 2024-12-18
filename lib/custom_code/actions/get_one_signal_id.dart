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

Future<String?> getOneSignalId() async {
  return "none";
  /*
  try {
    // Retrieve the OneSignal Subscription ID
    final subscriptionId = await OneSignal.User.getOnesignalId();
    OneSignal.shared.getDeviceState().then((deviceState) {
      final playerId = deviceState?.userId;
      print("Player ID: $playerId");
      return playerId;
    });

    return "none";
  } catch (e) {
    print('Error retrieving OneSignal ID: $e');
    return "error"; // Return null in case of an error
  }
  */
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
