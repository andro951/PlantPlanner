import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'plant_search_widget.dart' show PlantSearchWidget;
import 'package:flutter/material.dart';

class PlantSearchModel extends FlutterFlowModel<PlantSearchWidget> {
  ///  Local state fields for this page.

  List<PlantsOldRecord> allPlants = [];
  void addToAllPlants(PlantsOldRecord item) => allPlants.add(item);
  void removeFromAllPlants(PlantsOldRecord item) => allPlants.remove(item);
  void removeAtIndexFromAllPlants(int index) => allPlants.removeAt(index);
  void insertAtIndexInAllPlants(int index, PlantsOldRecord item) =>
      allPlants.insert(index, item);
  void updateAllPlantsAtIndex(int index, Function(PlantsOldRecord) updateFn) =>
      allPlants[index] = updateFn(allPlants[index]);

  List<PlantsOldRecord> filteredPlants = [];
  void addToFilteredPlants(PlantsOldRecord item) => filteredPlants.add(item);
  void removeFromFilteredPlants(PlantsOldRecord item) =>
      filteredPlants.remove(item);
  void removeAtIndexFromFilteredPlants(int index) =>
      filteredPlants.removeAt(index);
  void insertAtIndexInFilteredPlants(int index, PlantsOldRecord item) =>
      filteredPlants.insert(index, item);
  void updateFilteredPlantsAtIndex(
          int index, Function(PlantsOldRecord) updateFn) =>
      filteredPlants[index] = updateFn(filteredPlants[index]);

  int allPlantsCount = -1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PlantSearch widget.
  List<PlantsOldRecord>? allPlantsFromQuery;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
