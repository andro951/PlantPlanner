import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'apiurl_widget.dart' show ApiurlWidget;
import 'package:flutter/material.dart';

class ApiurlModel extends FlutterFlowModel<ApiurlWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (GetPlantURL)] action in Button widget.
  ApiCallResponse? apiResultmei;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
