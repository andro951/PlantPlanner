import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'plant_info_model.dart';
export 'plant_info_model.dart';

class PlantInfoWidget extends StatefulWidget {
  const PlantInfoWidget({
    super.key,
    required this.plant,
  });

  final PlantQueryRow? plant;

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
      _model.permapeoplePlant = await PermapeoplePlantByIdCall.call(
        id: valueOrDefault<int>(
          widget.plant?.permapeopleId,
          0,
        ),
      );

      if ((_model.permapeoplePlant?.succeeded ?? true)) {
        logFirebaseEvent('PlantInfo_update_page_state');

        safeSetState(() {});
      } else {
        logFirebaseEvent('PlantInfo_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to get plant from Permapeople: ${widget.plant?.permapeopleId.toString()}',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
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
      onTap: () => FocusScope.of(context).unfocus(),
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
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('PLANT_INFO_PAGE_ADD_PLANT_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed(
                      'PlantConfirmationPage',
                      queryParameters: {
                        'plant': serializeParam(
                          widget.plant,
                          ParamType.SqliteRow,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Add Plant',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  PermapeoplePlantByIdCall.imagesTitle(
                                    (_model.permapeoplePlant?.jsonBody ?? ''),
                                  ),
                                  'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                ),
                                width: 128.0,
                                height: 128.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  PermapeoplePlantByIdCall.imagesThumb(
                                    (_model.permapeoplePlant?.jsonBody ?? ''),
                                  ),
                                  'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                ),
                                width: 128.0,
                                height: 128.0,
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
                                  (_model.permapeoplePlant?.jsonBody ?? ''),
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
                                PermapeoplePlantByIdCall.scientificName(
                                  (_model.permapeoplePlant?.jsonBody ?? ''),
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
                                  (_model.permapeoplePlant?.jsonBody ?? ''),
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
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 2.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent4,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).borderColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Description: ${valueOrDefault<String>(
                                    PermapeoplePlantByIdCall.description(
                                      (_model.permapeoplePlant?.jsonBody ?? ''),
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
                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .borderColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
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
              ].divide(const SizedBox(height: 2.0)),
            ),
          ),
        ),
      ),
    );
  }
}
