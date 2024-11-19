import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'my_plants_model.dart';
export 'my_plants_model.dart';

class MyPlantsWidget extends StatefulWidget {
  const MyPlantsWidget({super.key});

  @override
  State<MyPlantsWidget> createState() => _MyPlantsWidgetState();
}

class _MyPlantsWidgetState extends State<MyPlantsWidget> {
  late MyPlantsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPlantsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyPlants'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MY_PLANTS_PAGE_MyPlants_ON_INIT_STATE');
      logFirebaseEvent('MyPlants_firestore_query');
      _model.myPlantsResult = await queryMyPlantsRecordOnce(
        parent: currentUserReference,
      );
      logFirebaseEvent('MyPlants_update_page_state');
      _model.images = functions
          .makeListOfImage(
              'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
              valueOrDefault<int>(
                _model.myPlantsResult?.length,
                0,
              ))
          .toList()
          .cast<String>();
      logFirebaseEvent('MyPlants_update_page_state');
      _model.myPlants = _model.myPlantsResult!.toList().cast<MyPlantsRecord>();
      safeSetState(() {});
      logFirebaseEvent('MyPlants_custom_action');
      _model.foundPlantImages = await actions.getPlantImages(
        _model.myPlants.toList(),
      );
      logFirebaseEvent('MyPlants_update_page_state');
      _model.images = _model.foundPlantImages!.toList().cast<String>();
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('MY_PLANTS_PAGE_LOG_OUT_BTN_ON_TAP');
                          logFirebaseEvent('Button_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('SignupPage', context.mounted);
                        },
                        text: 'Log Out',
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
                    ),
                  ],
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final myPlant = _model.myPlants.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: myPlant.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 2.0),
                        itemBuilder: (context, myPlantIndex) {
                          final myPlantItem = myPlant[myPlantIndex];
                          return Container(
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
                                      valueOrDefault<String>(
                                        _model.images[myPlantIndex],
                                        'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                      ),
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
                                          myPlantItem.nickname,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Itim',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          myPlantItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Itim',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.getWaterInXDaysString(
                                                myPlantItem.lastWatered!,
                                                myPlantItem.wateringFrequency),
                                            'WaterInXDays',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Itim',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        if (myPlantItem.fertilizerReminders)
                                          Text(
                                            functions.getFertilizeInXDaysString(
                                                myPlantItem.lastFertilized!,
                                                myPlantItem
                                                    .fertilizerFrequencyInDays),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Itim',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        Text(
                                          myPlantItem.indoor
                                              ? 'Indoor'
                                              : 'Outside',
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
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('MY_PLANTS_PAGE_NewPlant_ON_TAP');
                        logFirebaseEvent('NewPlant_navigate_to');

                        context.pushNamed('PlantSearch');

                        logFirebaseEvent('NewPlant_google_analytics_event');
                        logFirebaseEvent('clickAddNewPlant');
                      },
                      text: '+',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryButtonColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
