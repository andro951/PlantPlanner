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

// Initiates OneSignal
// Asks for permission to send notifications
Future initOneSignal() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("6c827aaf-20d2-4e05-87ab-4f38e3be97dd");

// The promptForPushNotificationsWithUserResponse function will show the
// iOS or Android push notification prompt.
  OneSignal.Notifications.requestPermission(true);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
