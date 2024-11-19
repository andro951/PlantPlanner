import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime calculateNextWatering(
  double currentTemperature,
  double currentHumidity,
  double currentRainFall,
  double wateringFrequency,
  double maxTemp,
  double minTemp,
  double maxHumidity,
  double minHumidity,
  DateTime lastWateredDate,
  bool location,
) {
  // THIS FUNCTION IS NOT USED

  double daysUntilNextWatering = wateringFrequency;

  // Adjust based on temperature
  if (currentTemperature > maxTemp) {
    daysUntilNextWatering -= 1; // Water more frequently if it's hot
  } else if (currentTemperature < minTemp) {
    daysUntilNextWatering += 1; // Water less frequently if it's cold
  } else
    daysUntilNextWatering -= 1; // Take away one day

  // Adjust based on humidity
  if (currentHumidity > maxHumidity) {
    daysUntilNextWatering += 1; // High humidity slows soil drying
  } else if (currentHumidity < minHumidity) {
    daysUntilNextWatering -= 1; // Low humidity dries soil faster
  } else
    daysUntilNextWatering -= 1;

  // Adjust based on rainfall (if it's raining, delay watering)
  // If the plant's location is inside set rainfall to 0
  if (location == true) currentRainFall = 0;
  if (currentRainFall > 0) {
    daysUntilNextWatering += 2; // Delay watering by 2 days if there's rainfall
  } else
    daysUntilNextWatering -= 1; // Take away a day for no rain

  return lastWateredDate.add(Duration(days: daysUntilNextWatering.toInt()));
}

double celsiusToFahrenheit(double celsius) {
  return celsius * 1.8 + 32.0;
}

String getWaterInXDaysString(
  DateTime lastWatered,
  double wateringFrequency,
) {
  final double daysSinceWatered =
      DateTime.now().difference(lastWatered).inHours / 24.0;
  final double daysToNextWater = wateringFrequency - daysSinceWatered;
  if (daysToNextWater <= 0.0) {
    return "Water Now!";
  } else {
    int days = daysToNextWater.floor();
    double hrs = (daysToNextWater - days) * 24.0;
    int hours = hrs.floor();
    double min = (hrs - hours) * 60.0;
    int minutes = min.floor();
    return "Water in $days d, $hours h, $minutes m.";
  }
}

String getFertilizeInXDaysString(
  DateTime lastFertilized,
  double fertilizeFrequency,
) {
  final double daysSinceWatered =
      DateTime.now().difference(lastFertilized).inHours / 24.0;
  final double daysToNextFertilize = fertilizeFrequency - daysSinceWatered;
  if (daysToNextFertilize <= 0.0) {
    return "Fertilize Now!";
  } else {
    int days = daysToNextFertilize.floor();
    double hrs = (daysToNextFertilize - days) * 24.0;
    int hours = hrs.floor();
    double min = (hrs - hours) * 60.0;
    int minutes = min.floor();
    return "Fertilize in $days d, $hours h, $minutes m.";
  }
}

bool containsString(
  String string,
  String subString,
) {
  if (string.length < 1) return false;

  return string.toLowerCase().contains(subString.toLowerCase());
}

String doubleToString(double d) {
  return "$d";
}

List<String> makeListOfImage(
  String image,
  int count,
) {
  return List<String>.filled(count, image);
}

String stringAsImagePath(String string) {
  return string;
}
