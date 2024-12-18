import '/components/confirmation_box_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'dropdown_menu_model.dart';
export 'dropdown_menu_model.dart';

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({
    super.key,
    required this.myPage,
  });

  final String? myPage;

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  late DropdownMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= 'Home Page',
      ),
      options: const [
        'Home Page',
        'My Plants',
        'Plant Search',
        'Disease Search',
        'Log Out'
      ],
      onChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val);
        logFirebaseEvent('DROPDOWN_MENU_DropDown_dlm0u021_ON_FORM_');
        if (_model.dropDownValue == widget.myPage) {
          return;
        }

        if (_model.dropDownValue == 'Home Page') {
          logFirebaseEvent('DropDown_navigate_to');

          context.pushNamed('HomePage');
        } else {
          if (_model.dropDownValue == 'Plant Search') {
            logFirebaseEvent('DropDown_navigate_to');

            context.pushNamed('PlantSearch');
          } else {
            if (_model.dropDownValue == 'My Plants') {
              logFirebaseEvent('DropDown_navigate_to');

              context.pushNamed('MyPlants');
            } else {
              if (_model.dropDownValue == 'Log Out') {
                logFirebaseEvent('DropDown_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ConfirmationBoxWidget(
                        message: 'Log out of your account?',
                        action: () async {
                          logFirebaseEvent('_navigate_to');

                          context.goNamedAuth('SignupPage', context.mounted);
                        },
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              } else {
                if (_model.dropDownValue == 'Disease Search') {
                  logFirebaseEvent('DropDown_navigate_to');

                  context.pushNamed('DiseaseResults');
                }
              }
            }
          }
        }

        logFirebaseEvent('DropDown_set_form_field');
        safeSetState(() {
          _model.dropDownValueController?.value = widget.myPage!;
        });
      },
      width: 150.0,
      height: 40.0,
      textStyle: FlutterFlowTheme.of(context).titleLarge.override(
            fontFamily: 'Inter Tight',
            fontSize: 12.5,
            letterSpacing: 0.0,
            fontWeight: FontWeight.bold,
          ),
      icon: Icon(
        Icons.menu_rounded,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 40.0,
      ),
      fillColor: FlutterFlowTheme.of(context).primaryButtonColor,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 10.0,
      margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
