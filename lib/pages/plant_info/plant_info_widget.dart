import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/confirmation_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'plant_info_model.dart';
export 'plant_info_model.dart';

class PlantInfoWidget extends StatefulWidget {
  const PlantInfoWidget({
    super.key,
    required this.permapeopleId,
    this.myPlant,
    this.plantParameter,
    bool? addPlantMode,
  }) : addPlantMode = addPlantMode ?? false;

  final int? permapeopleId;
  final MyPlantsRecord? myPlant;
  final PlantQueryRow? plantParameter;
  final bool addPlantMode;

  @override
  State<PlantInfoWidget> createState() => _PlantInfoWidgetState();
}

class _PlantInfoWidgetState extends State<PlantInfoWidget> {
  late PlantInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantInfoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlantInfo'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLANT_INFO_PAGE_PlantInfo_ON_INIT_STATE');
      logFirebaseEvent('PlantInfo_backend_call');
      _model.searchedPlant = await SQLiteManager.instance.getPlantById(
        permapeopleId: widget.permapeopleId!,
      );
      logFirebaseEvent('PlantInfo_update_page_state');
      _model.plant = _model.searchedPlant?.firstOrNull;
      logFirebaseEvent('PlantInfo_backend_call');
      _model.permapeoplePlant = await PermapeoplePlantByIdCall.call(
        id: widget.permapeopleId,
      );

      if (!(_model.permapeoplePlant?.succeeded ?? true)) {
        logFirebaseEvent('PlantInfo_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to get plant from Permapeople: ${valueOrDefault<String>(
                widget.permapeopleId?.toString(),
                '0',
              )}',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
      logFirebaseEvent('PlantInfo_update_page_state');

      safeSetState(() {});
    });

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.addPlantMode)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        key: const ValueKey('Button_p6sd'),
                        onPressed: () async {
                          logFirebaseEvent(
                              'PLANT_INFO_PAGE_ADD_PLANT_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            'PlantConfirmationPage',
                            queryParameters: {
                              'plant': serializeParam(
                                widget.plantParameter,
                                ParamType.SqliteRow,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Add Plant',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).primaryButtonColor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                if (widget.myPlant != null)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PLANT_INFO_PAGE_EDIT_PLANT_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            'PlantConfirmationPage',
                            queryParameters: {
                              'plant': serializeParam(
                                widget.plantParameter,
                                ParamType.SqliteRow,
                              ),
                              'myPlant': serializeParam(
                                widget.myPlant,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'myPlant': widget.myPlant,
                            },
                          );
                        },
                        text: 'Edit Plant',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).primaryButtonColor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PLANT_INFO_PAGE_DELETE_PLANT_BTN_ON_TAP');
                          logFirebaseEvent('Button_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ConfirmationBoxWidget(
                                    message:
                                        'Are you sure you want to delete your plant, ${valueOrDefault<String>(
                                      widget.myPlant?.nickname,
                                      'Nickname',
                                    )}?',
                                    action: () async {
                                      logFirebaseEvent('_backend_call');
                                      await widget.myPlant!.reference.delete();
                                      logFirebaseEvent('_navigate_to');

                                      context.goNamed('MyPlants');

                                      logFirebaseEvent('_update_page_state');

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Delete Plant',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).primaryButtonColor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            PermapeoplePlantByIdCall
                                                .imagesThumb(
                                              (_model.permapeoplePlant
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                          ),
                                          width: 256.0,
                                          height: 256.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 12.0)),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Name: ${valueOrDefault<String>(
                                          PermapeoplePlantByIdCall.name(
                                            (_model.permapeoplePlant
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          'name',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Scientific Name: ${valueOrDefault<String>(
                                          PermapeoplePlantByIdCall
                                              .scientificName(
                                            (_model.permapeoplePlant
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          'scientificName',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Type: ${valueOrDefault<String>(
                                          PermapeoplePlantByIdCall.type(
                                            (_model.permapeoplePlant
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          'type',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Family: ${valueOrDefault<String>(
                                          _model.plant?.family,
                                          'family',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Min Temp: ${valueOrDefault<String>(
                                          _model.plant?.minTemperatureCelsius
                                              .toString(),
                                          'minTemp',
                                        )} °C / ${isWeb ? 'minTemp' : functions.celsiusToFahrenheit(valueOrDefault<double>(
                                              _model
                                                  .plant?.minTemperatureCelsius,
                                              0.0,
                                            )).toString()} °F',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Max Temp: ${valueOrDefault<String>(
                                          _model.plant?.maxTemperatureCelsius
                                              .toString(),
                                          'maxTemp',
                                        )} °C / ${isWeb ? 'maxTemp' : functions.celsiusToFahrenheit(valueOrDefault<double>(
                                              _model
                                                  .plant?.maxTemperatureCelsius,
                                              0.0,
                                            )).toString()} °F',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Light Type: ${valueOrDefault<String>(
                                          _model.plant?.lightType,
                                          'lightType',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Hours of Light per Day: ${valueOrDefault<String>(
                                          _model.plant?.hoursOfLightPerDay
                                              .toString(),
                                          'hrsOfLightPerDay',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Min Humidity: ${valueOrDefault<String>(
                                          _model.plant?.minHumidity.toString(),
                                          'minHumidity',
                                        )} %',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Max Humidity: ${valueOrDefault<String>(
                                          _model.plant?.maxHumidity.toString(),
                                          'maxHumidity',
                                        )} %',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Min PH: ${valueOrDefault<String>(
                                          _model.plant?.minPH.toString(),
                                          'minPH',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Max PH: ${valueOrDefault<String>(
                                          _model.plant?.maxPH.toString(),
                                          'maxPH',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Expected Height: ${valueOrDefault<String>(
                                          _model.plant?.expectedHeightMeters
                                              .toString(),
                                          'expectedHeight',
                                        )} m',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Expected Width: ${valueOrDefault<String>(
                                          _model.plant?.expectedWidthMeters
                                              .toString(),
                                          'expectedWidth',
                                        )} m',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Fertilizer Type: ${valueOrDefault<String>(
                                          _model.plant?.fertilizerType,
                                          'fertilizerType',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Soil Type: ${valueOrDefault<String>(
                                          _model.plant?.soilType,
                                          'soilType',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Itim',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (!isWeb)
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: Text(
                                    'Description: ${valueOrDefault<String>(
                                      PermapeoplePlantByIdCall.description(
                                        (_model.permapeoplePlant?.jsonBody ??
                                            ''),
                                      ),
                                      'description',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Itim',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (!isWeb)
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final data = PermapeoplePlantByIdCall.data(
                                      (_model.permapeoplePlant?.jsonBody ?? ''),
                                    )?.toList() ??
                                    [];

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: data.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 2.0),
                                  itemBuilder: (context, dataIndex) {
                                    final dataItem = data[dataIndex];
                                    return Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            '${valueOrDefault<String>(
                                              getJsonField(
                                                dataItem,
                                                r'''$.key''',
                                              )?.toString(),
                                              'key',
                                            )}: ${valueOrDefault<String>(
                                              getJsonField(
                                                dataItem,
                                                r'''$.value''',
                                              )?.toString(),
                                              'value',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Itim',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 2.0)),
            ),
          ),
        ),
      ),
    );
  }
}
