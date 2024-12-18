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

import 'package:sqflite/sqflite.dart';

Future<List<String>> getPlantImagesFromNotification(
    List<NotificationStruct> notifications) async {
  // Open the SQLite database
  //final db = await openDatabase('plants.db');
  final db = SQLiteManager.instance.database;
  // Initialize a list to store the images
  List<String> images = [];

  // // Loop through each element in the myPlants list
  for (var notification in notifications) {
    //Fetch the ThumbImage for the current PermapeopleId
    final result = await db.rawQuery(
        "SELECT ThumbImage FROM Plants WHERE PermapeopleId = ${notification.permapeopleId} LIMIT 1;");

    // If an image is found, add it to the list; otherwise, add a placeholder
    if (result.isNotEmpty && result.first['ThumbImage'] != null) {
      images.add(result.first['ThumbImage'] as String);
    } else {
      images.add(
          'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg'); // Fallback image
    }
  }

  // Close the database if necessary (optional, depends on your SQLite setup)
  //await db.close();

  // Return the list of images
  return images;
}
