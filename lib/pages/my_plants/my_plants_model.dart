import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  String testField = 'test';

  String permapeopleIds = 'permapeopleIds';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in MyPlants widget.
  List<MyPlantsRecord>? myPlantsResult;
  // Stores action output result for [Custom Action - getPlantImages] action in MyPlants widget.
  List<String>? foundPlantImages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
