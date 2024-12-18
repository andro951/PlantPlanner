import '/backend/api_requests/api_calls.dart';
import '/components/dropdown_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'disease_results_widget.dart' show DiseaseResultsWidget;
import 'package:flutter/material.dart';

class DiseaseResultsModel extends FlutterFlowModel<DiseaseResultsWidget> {
  ///  Local state fields for this page.

  List<dynamic> searchDisease = [];
  void addToSearchDisease(dynamic item) => searchDisease.add(item);
  void removeFromSearchDisease(dynamic item) => searchDisease.remove(item);
  void removeAtIndexFromSearchDisease(int index) =>
      searchDisease.removeAt(index);
  void insertAtIndexInSearchDisease(int index, dynamic item) =>
      searchDisease.insert(index, item);
  void updateSearchDiseaseAtIndex(int index, Function(dynamic) updateFn) =>
      searchDisease[index] = updateFn(searchDisease[index]);

  bool loadingDiseases = false;

  ///  State fields for stateful widgets in this page.

  // Model for dropdown_menu component.
  late DropdownMenuModel dropdownMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (PlantDiseaseIdentification)] action in Button widget.
  ApiCallResponse? apiResultmy4;

  @override
  void initState(BuildContext context) {
    dropdownMenuModel = createModel(context, () => DropdownMenuModel());
  }

  @override
  void dispose() {
    dropdownMenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
