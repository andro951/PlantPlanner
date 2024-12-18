import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dropdown_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<NotificationStruct> notifications = [];
  void addToNotifications(NotificationStruct item) => notifications.add(item);
  void removeFromNotifications(NotificationStruct item) =>
      notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, NotificationStruct item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(
          int index, Function(NotificationStruct) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  int myPlantsRefreshTimer = 3;

  bool loadingNotifications = true;

  ///  State fields for stateful widgets in this page.

  InstantTimer? oneSecTimer;
  // Model for dropdown_menu component.
  late DropdownMenuModel dropdownMenuModel;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  MyPlantsRecord? myPlantDoc;

  @override
  void initState(BuildContext context) {
    dropdownMenuModel = createModel(context, () => DropdownMenuModel());
  }

  @override
  void dispose() {
    oneSecTimer?.cancel();
    dropdownMenuModel.dispose();
  }

  /// Action blocks.
  Future getMyPlants(BuildContext context) async {
    List<MyPlantsRecord>? myPlantsResult;
    List<String>? foundImages;

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
    notifications = functions
        .getNotificationList(myPlantsResult.toList())
        .toList()
        .cast<NotificationStruct>();
    logFirebaseEvent('getMyPlants_custom_action');
    foundImages = await actions.getPlantImagesFromNotification(
      notifications.toList(),
    );
    logFirebaseEvent('getMyPlants_update_page_state');
    images = foundImages.toList().cast<String>();
  }
}
