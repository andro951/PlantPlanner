import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'plant_search_widget.dart' show PlantSearchWidget;
import 'package:flutter/material.dart';

class PlantSearchModel extends FlutterFlowModel<PlantSearchWidget> {
  ///  Local state fields for this page.

  List<PlantQueryRow> searchedPlants = [];
  void addToSearchedPlants(PlantQueryRow item) => searchedPlants.add(item);
  void removeFromSearchedPlants(PlantQueryRow item) =>
      searchedPlants.remove(item);
  void removeAtIndexFromSearchedPlants(int index) =>
      searchedPlants.removeAt(index);
  void insertAtIndexInSearchedPlants(int index, PlantQueryRow item) =>
      searchedPlants.insert(index, item);
  void updateSearchedPlantsAtIndex(
          int index, Function(PlantQueryRow) updateFn) =>
      searchedPlants[index] = updateFn(searchedPlants[index]);

  bool showCameraWidgets = false;

  bool fromImage = true;

  String plantURL =
      'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg';

  String recognizedPlantName = ' ';

  String recognizedPlantScientificName = ' ';

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (PlantQuery)] action in SearchBar widget.
  List<PlantQueryRow>? plantSearchResult;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - SQLite (PlantQuery)] action in DropDown widget.
  List<PlantQueryRow>? plantSearchResult2;
  // State field(s) for ImageURL widget.
  FocusNode? imageURLFocusNode;
  TextEditingController? imageURLTextController;
  String? Function(BuildContext, String?)? imageURLTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetPlantURL)] action in Button widget.
  ApiCallResponse? recognizedPlantAPIResult;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (GetPlantURL)] action in Button widget.
  ApiCallResponse? recognizedPlantAPIResult2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    imageURLFocusNode?.dispose();
    imageURLTextController?.dispose();
  }
}
