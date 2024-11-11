import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _temperature = 0.0;
  double get temperature => _temperature;
  set temperature(double value) {
    _temperature = value;
  }

  double _humidity = 0.0;
  double get humidity => _humidity;
  set humidity(double value) {
    _humidity = value;
  }

  dynamic _rainFall;
  dynamic get rainFall => _rainFall;
  set rainFall(dynamic value) {
    _rainFall = value;
  }
}
