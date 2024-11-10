import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'backend_test_widget.dart' show BackendTestWidget;
import 'package:flutter/material.dart';

class BackendTestModel extends FlutterFlowModel<BackendTestWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (GetPlantURL)] action in Button widget.
  ApiCallResponse? apiResultmei;
  // Stores action output result for [Backend Call - API (Plant Identification)] action in Button widget.
  ApiCallResponse? apiResultmmg;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
