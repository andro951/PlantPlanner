import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dropdown_menu_widget.dart' show DropdownMenuWidget;
import 'package:flutter/material.dart';

class DropdownMenuModel extends FlutterFlowModel<DropdownMenuWidget> {
  ///  Local state fields for this component.

  List<String> menuChoice = ['Home Page'];
  void addToMenuChoice(String item) => menuChoice.add(item);
  void removeFromMenuChoice(String item) => menuChoice.remove(item);
  void removeAtIndexFromMenuChoice(int index) => menuChoice.removeAt(index);
  void insertAtIndexInMenuChoice(int index, String item) =>
      menuChoice.insert(index, item);
  void updateMenuChoiceAtIndex(int index, Function(String) updateFn) =>
      menuChoice[index] = updateFn(menuChoice[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
