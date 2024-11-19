import '/flutter_flow/flutter_flow_util.dart';
import 'profile_creation_page_widget.dart' show ProfileCreationPageWidget;
import 'package:flutter/material.dart';

class ProfileCreationPageModel
    extends FlutterFlowModel<ProfileCreationPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for PC-Username widget.
  FocusNode? pCUsernameFocusNode;
  TextEditingController? pCUsernameTextController;
  String? Function(BuildContext, String?)? pCUsernameTextControllerValidator;
  // State field(s) for PC-PhoneNumber widget.
  FocusNode? pCPhoneNumberFocusNode;
  TextEditingController? pCPhoneNumberTextController;
  String? Function(BuildContext, String?)? pCPhoneNumberTextControllerValidator;
  // State field(s) for PC-Location widget.
  FocusNode? pCLocationFocusNode;
  TextEditingController? pCLocationTextController;
  String? Function(BuildContext, String?)? pCLocationTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    pCUsernameFocusNode?.dispose();
    pCUsernameTextController?.dispose();

    pCPhoneNumberFocusNode?.dispose();
    pCPhoneNumberTextController?.dispose();

    pCLocationFocusNode?.dispose();
    pCLocationTextController?.dispose();
  }
}
