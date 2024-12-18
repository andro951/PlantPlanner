import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/dropdown_menu_widget.dart';
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

  bool loadingPlants = false;

  ///  State fields for stateful widgets in this page.

  // Model for dropdown_menu component.
  late DropdownMenuModel dropdownMenuModel;
  // State field(s) for SearchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
  void initState(BuildContext context) {
    dropdownMenuModel = createModel(context, () => DropdownMenuModel());
  }

  @override
  void dispose() {
    dropdownMenuModel.dispose();
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    imageURLFocusNode?.dispose();
    imageURLTextController?.dispose();
  }

  /// Action blocks.
  Future searchForPlants(BuildContext context) async {
    List<PlantQueryRow>? plantSearchResult;

    logFirebaseEvent('SearchForPlants_backend_call');
    plantSearchResult = await SQLiteManager.instance.plantQuery(
      searchString: searchBarTextController.text,
      column: valueOrDefault<String>(
        dropDownValue,
        'Name',
      ),
    );
    logFirebaseEvent('SearchForPlants_update_page_state');
    searchedPlants = plantSearchResult.toList().cast<PlantQueryRow>();
    loadingPlants = false;
  }

  Future resetPlants(BuildContext context) async {
    logFirebaseEvent('ResetPlants_update_page_state');
    searchedPlants = [];
    loadingPlants = true;
  }
}
