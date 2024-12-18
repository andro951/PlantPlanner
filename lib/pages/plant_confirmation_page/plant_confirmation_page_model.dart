import '/flutter_flow/flutter_flow_util.dart';
import 'plant_confirmation_page_widget.dart' show PlantConfirmationPageWidget;
import 'package:flutter/material.dart';

class PlantConfirmationPageModel
    extends FlutterFlowModel<PlantConfirmationPageWidget> {
  ///  Local state fields for this page.

  DateTime? lastWateredDate;

  DateTime? lastFertilizedDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Nickname widget.
  FocusNode? nicknameFocusNode;
  TextEditingController? nicknameTextController;
  String? Function(BuildContext, String?)? nicknameTextControllerValidator;
  String? _nicknameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please give this plant a nickname.';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for IndoorsCheckbox widget.
  bool? indoorsCheckboxValue;
  // State field(s) for WaterCheckbox widget.
  bool? waterCheckboxValue;
  DateTime? datePicked1;
  // State field(s) for WateringFrequency widget.
  FocusNode? wateringFrequencyFocusNode;
  TextEditingController? wateringFrequencyTextController;
  String? Function(BuildContext, String?)?
      wateringFrequencyTextControllerValidator;
  String? _wateringFrequencyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[+-]?([0-9]*[.])?[0-9]+([eE][+-]?[0-9]+)?\$').hasMatch(val)) {
      return 'Please input a number for Watering Frequency.';
    }
    return null;
  }

  // State field(s) for FertilizeCheckbox widget.
  bool? fertilizeCheckboxValue;
  DateTime? datePicked2;
  // State field(s) for FertilizerFrequency widget.
  FocusNode? fertilizerFrequencyFocusNode;
  TextEditingController? fertilizerFrequencyTextController;
  String? Function(BuildContext, String?)?
      fertilizerFrequencyTextControllerValidator;
  String? _fertilizerFrequencyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[+-]?([0-9]*[.])?[0-9]+([eE][+-]?[0-9]+)?\$').hasMatch(val)) {
      return 'Please input a number for Fertilizer Frequency.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    nicknameTextControllerValidator = _nicknameTextControllerValidator;
    wateringFrequencyTextControllerValidator =
        _wateringFrequencyTextControllerValidator;
    fertilizerFrequencyTextControllerValidator =
        _fertilizerFrequencyTextControllerValidator;
  }

  @override
  void dispose() {
    nicknameFocusNode?.dispose();
    nicknameTextController?.dispose();

    wateringFrequencyFocusNode?.dispose();
    wateringFrequencyTextController?.dispose();

    fertilizerFrequencyFocusNode?.dispose();
    fertilizerFrequencyTextController?.dispose();
  }
}
