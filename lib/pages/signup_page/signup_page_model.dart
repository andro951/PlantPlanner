import '/flutter_flow/flutter_flow_util.dart';
import 'signup_page_widget.dart' show SignupPageWidget;
import 'package:flutter/material.dart';

class SignupPageModel extends FlutterFlowModel<SignupPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SignUpEmailBar widget.
  FocusNode? signUpEmailBarFocusNode;
  TextEditingController? signUpEmailBarTextController;
  String? Function(BuildContext, String?)?
      signUpEmailBarTextControllerValidator;
  String? _signUpEmailBarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field Is Required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for SignUpPasswordBar widget.
  FocusNode? signUpPasswordBarFocusNode;
  TextEditingController? signUpPasswordBarTextController;
  late bool signUpPasswordBarVisibility;
  String? Function(BuildContext, String?)?
      signUpPasswordBarTextControllerValidator;
  String? _signUpPasswordBarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field Is Required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for ConfirmPasswordBar widget.
  FocusNode? confirmPasswordBarFocusNode;
  TextEditingController? confirmPasswordBarTextController;
  late bool confirmPasswordBarVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordBarTextControllerValidator;
  String? _confirmPasswordBarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field Is Required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for LoginEmailBar widget.
  FocusNode? loginEmailBarFocusNode;
  TextEditingController? loginEmailBarTextController;
  String? Function(BuildContext, String?)? loginEmailBarTextControllerValidator;
  String? _loginEmailBarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field Is Required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for LoginPasswordBar widget.
  FocusNode? loginPasswordBarFocusNode;
  TextEditingController? loginPasswordBarTextController;
  late bool loginPasswordBarVisibility;
  String? Function(BuildContext, String?)?
      loginPasswordBarTextControllerValidator;
  String? _loginPasswordBarTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field Is Required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    signUpEmailBarTextControllerValidator =
        _signUpEmailBarTextControllerValidator;
    signUpPasswordBarVisibility = false;
    signUpPasswordBarTextControllerValidator =
        _signUpPasswordBarTextControllerValidator;
    confirmPasswordBarVisibility = false;
    confirmPasswordBarTextControllerValidator =
        _confirmPasswordBarTextControllerValidator;
    loginEmailBarTextControllerValidator =
        _loginEmailBarTextControllerValidator;
    loginPasswordBarVisibility = false;
    loginPasswordBarTextControllerValidator =
        _loginPasswordBarTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    signUpEmailBarFocusNode?.dispose();
    signUpEmailBarTextController?.dispose();

    signUpPasswordBarFocusNode?.dispose();
    signUpPasswordBarTextController?.dispose();

    confirmPasswordBarFocusNode?.dispose();
    confirmPasswordBarTextController?.dispose();

    loginEmailBarFocusNode?.dispose();
    loginEmailBarTextController?.dispose();

    loginPasswordBarFocusNode?.dispose();
    loginPasswordBarTextController?.dispose();
  }
}
