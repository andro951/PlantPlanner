import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'watering_test_widget.dart' show WateringTestWidget;
import 'package:flutter/material.dart';

class WateringTestModel extends FlutterFlowModel<WateringTestWidget> {
  ///  Local state fields for this page.

  String weatherAPIResult = 'weatherAPIResult';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetWeather)] action in Button widget.
  ApiCallResponse? apiWeatherResults;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
