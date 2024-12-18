import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plant_info_widget.dart' show PlantInfoWidget;
import 'package:flutter/material.dart';

class PlantInfoModel extends FlutterFlowModel<PlantInfoWidget> {
  ///  Local state fields for this page.

  GetPlantByIdRow? plant;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (GetPlantById)] action in PlantInfo widget.
  List<GetPlantByIdRow>? searchedPlant;
  // Stores action output result for [Backend Call - API (permapeoplePlantById)] action in PlantInfo widget.
  ApiCallResponse? permapeoplePlant;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
