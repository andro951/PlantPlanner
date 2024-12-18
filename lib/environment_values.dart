import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _organfeature = data['organfeature'];
      _relatedImage = data['relatedImage'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _organfeature = '';
  String get organfeature => _organfeature;

  bool _relatedImage = false;
  bool get relatedImage => _relatedImage;
}