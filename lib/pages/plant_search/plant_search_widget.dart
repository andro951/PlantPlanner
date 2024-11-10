import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'plant_search_model.dart';
export 'plant_search_model.dart';

class PlantSearchWidget extends StatefulWidget {
  const PlantSearchWidget({super.key});

  @override
  State<PlantSearchWidget> createState() => _PlantSearchWidgetState();
}

class _PlantSearchWidgetState extends State<PlantSearchWidget> {
  late PlantSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantSearchModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlantSearch'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLANT_SEARCH_PlantSearch_ON_INIT_STATE');
      logFirebaseEvent('PlantSearch_firestore_query');
      _model.allPlantsFromQuery = await queryPlantsOldRecordOnce();
      logFirebaseEvent('PlantSearch_update_page_state');
      _model.allPlants =
          _model.allPlantsFromQuery!.toList().cast<PlantsOldRecord>();
      _model.allPlantsCount = _model.allPlants.length;
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'PLANT_SEARCH_TextField_0ux9hkic_ON_TEXTF');
                          logFirebaseEvent('TextField_update_page_state');
                          _model.filteredPlants = _model.allPlants
                              .where((e) => functions.containsString(
                                  valueOrDefault<String>(
                                    () {
                                      if (_model.dropDownValue == 'Type') {
                                        return valueOrDefault<String>(
                                          e.type,
                                          'NAME',
                                        );
                                      } else if (_model.dropDownValue ==
                                          'Family') {
                                        return valueOrDefault<String>(
                                          e.family,
                                          'FAMILY',
                                        );
                                      } else {
                                        return valueOrDefault<String>(
                                          e.name,
                                          'NAME',
                                        );
                                      }
                                    }(),
                                    'NAME',
                                  ),
                                  _model.textController.text))
                              .toList()
                              .cast<PlantsOldRecord>();
                          safeSetState(() {});
                        },
                      ),
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Search Plants',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).borderColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Itim',
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= 'Name',
                    ),
                    options: const ['Name', 'Type', 'Family'],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue = val);
                      logFirebaseEvent(
                          'PLANT_SEARCH_DropDown_vo1yk05i_ON_FORM_W');
                      logFirebaseEvent('DropDown_update_page_state');
                      _model.filteredPlants = _model.allPlants
                          .where((e) => functions.containsString(
                              valueOrDefault<String>(
                                () {
                                  if (_model.dropDownValue == 'Type') {
                                    return valueOrDefault<String>(
                                      e.type,
                                      'NAME',
                                    );
                                  } else if (_model.dropDownValue == 'Family') {
                                    return valueOrDefault<String>(
                                      e.family,
                                      'FAMILY',
                                    );
                                  } else {
                                    return valueOrDefault<String>(
                                      e.name,
                                      'NAME',
                                    );
                                  }
                                }(),
                                'NAME',
                              ),
                              _model.textController.text))
                          .toList()
                          .cast<PlantsOldRecord>();
                      safeSetState(() {});
                    },
                    width: 120.0,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Itim',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Select...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ],
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final plantSearchListViewVariable =
                        _model.filteredPlants.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: plantSearchListViewVariable.length,
                      itemBuilder: (context, plantSearchListViewVariableIndex) {
                        final plantSearchListViewVariableItem =
                            plantSearchListViewVariable[
                                plantSearchListViewVariableIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PLANT_SEARCH_Container_bfv2n0sx_ON_TAP');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(
                              'PlantConfirmationPage',
                              queryParameters: {
                                'plant': serializeParam(
                                  plantSearchListViewVariableItem,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'plant': plantSearchListViewVariableItem,
                              },
                            );
                          },
                          child: Container(
                            width: 100.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).borderColor,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://picsum.photos/seed/45/600',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          plantSearchListViewVariableItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Itim',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
