import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dropdown_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_plants_widget.dart' show MyPlantsWidget;
import 'package:flutter/material.dart';

class MyPlantsModel extends FlutterFlowModel<MyPlantsWidget> {
  ///  Local state fields for this page.

  List<MyPlantsRecord> myPlants = [];
  void addToMyPlants(MyPlantsRecord item) => myPlants.add(item);
  void removeFromMyPlants(MyPlantsRecord item) => myPlants.remove(item);
  void removeAtIndexFromMyPlants(int index) => myPlants.removeAt(index);
  void insertAtIndexInMyPlants(int index, MyPlantsRecord item) =>
      myPlants.insert(index, item);
  void updateMyPlantsAtIndex(int index, Function(MyPlantsRecord) updateFn) =>
      myPlants[index] = updateFn(myPlants[index]);

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  int myPlantsRefreshCounter = 3;

  bool loadingMyPlants = true;

  ///  State fields for stateful widgets in this page.

  InstantTimer? timer1Second;
  // Model for dropdown_menu component.
  late DropdownMenuModel dropdownMenuModel;

  @override
  void initState(BuildContext context) {
    dropdownMenuModel = createModel(context, () => DropdownMenuModel());
  }

  @override
  void dispose() {
    timer1Second?.cancel();
    dropdownMenuModel.dispose();
  }

  /// Action blocks.
  Future getMyPlants(BuildContext context) async {
    List<MyPlantsRecord>? myPlantsResult;
    List<String>? foundPlantImages;

    logFirebaseEvent('getMyPlants_firestore_query');
    myPlantsResult = await queryMyPlantsRecordOnce(
      parent: currentUserReference,
    );
    logFirebaseEvent('getMyPlants_update_page_state');
    images = functions
        .makeListOfImage(
            'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
            myPlantsResult.length)
        .toList()
        .cast<String>();
    logFirebaseEvent('getMyPlants_update_page_state');
    myPlants = myPlantsResult.toList().cast<MyPlantsRecord>();
    logFirebaseEvent('getMyPlants_custom_action');
    foundPlantImages = await actions.getPlantImages(
      myPlants.toList(),
    );
    logFirebaseEvent('getMyPlants_update_page_state');
    images = foundPlantImages.toList().cast<String>();
  }
}
