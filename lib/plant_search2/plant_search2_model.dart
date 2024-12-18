import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'plant_search2_widget.dart' show PlantSearch2Widget;
import 'package:flutter/material.dart';

class PlantSearch2Model extends FlutterFlowModel<PlantSearch2Widget> {
  ///  Local state fields for this page.

  List<PlantDataRecord> searchedPlants = [];
  void addToSearchedPlants(PlantDataRecord item) => searchedPlants.add(item);
  void removeFromSearchedPlants(PlantDataRecord item) =>
      searchedPlants.remove(item);
  void removeAtIndexFromSearchedPlants(int index) =>
      searchedPlants.removeAt(index);
  void insertAtIndexInSearchedPlants(int index, PlantDataRecord item) =>
      searchedPlants.insert(index, item);
  void updateSearchedPlantsAtIndex(
          int index, Function(PlantDataRecord) updateFn) =>
      searchedPlants[index] = updateFn(searchedPlants[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - SQLite (PlantQuery)] action in DropDown widget.
  List<PlantQueryRow>? plantSearchResult2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
