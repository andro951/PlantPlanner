import '/auth/firebase_auth/auth_util.dart';
import '/components/dropdown_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
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
      await Future.wait([
        Future(() async {
          logFirebaseEvent('MyPlants_set_form_field');
          safeSetState(() {
            _model.dropdownMenuModel.dropDownValueController?.value =
                'My Plants';
          });
          logFirebaseEvent('MyPlants_action_block');
          await _model.getMyPlants(context);
          logFirebaseEvent('MyPlants_update_page_state');
          _model.loadingMyPlants = false;
          safeSetState(() {});
          logFirebaseEvent('MyPlants_start_periodic_action');
          _model.timer1Second = InstantTimer.periodic(
            duration: const Duration(milliseconds: 1000),
            callback: (timer) async {
              logFirebaseEvent('MyPlants_update_page_state');
              _model.myPlantsRefreshCounter = _model.myPlantsRefreshCounter + 1;
              if (_model.myPlantsRefreshCounter >= 5) {
                logFirebaseEvent('MyPlants_action_block');
                await _model.getMyPlants(context);
                logFirebaseEvent('MyPlants_update_page_state');
                _model.myPlantsRefreshCounter = 0;
                safeSetState(() {});
              } else {
                logFirebaseEvent('MyPlants_update_page_state');

                safeSetState(() {});
              }
            },
            startImmediately: true,
          );
        }),
        Future(() async {
          logFirebaseEvent('MyPlants_custom_action');
          await actions.loginOneSignal(
            currentUserUid,
          );
        }),
      ]);
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
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wrapWithModel(
                      model: _model.dropdownMenuModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const DropdownMenuWidget(
                        myPage: 'My Plants',
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Builder(
                        builder: (context) {
                          final myPlant = _model.myPlants.toList();

                          return RefreshIndicator(
                            onRefresh: () async {
                              logFirebaseEvent(
                                  'MY_PLANTS_ListView_9l2hdk8a_ON_PULL_TO_R');
                              logFirebaseEvent('ListView_action_block');
                              await _model.getMyPlants(context);
                              safeSetState(() {});
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: myPlant.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 2.0),
                              itemBuilder: (context, myPlantIndex) {
                                final myPlantItem = myPlant[myPlantIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MY_PLANTS_PAGE_Container_7c62i3g0_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'PlantInfo',
                                      queryParameters: {
                                        'permapeopleId': serializeParam(
                                          myPlantItem.permapeopleId,
                                          ParamType.int,
                                        ),
                                        'myPlant': serializeParam(
                                          myPlantItem,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'myPlant': myPlantItem,
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
                                        color: FlutterFlowTheme.of(context)
                                            .borderColor,
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                _model.images.elementAtOrNull(
                                                    myPlantIndex),
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  myPlantItem.nickname,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Itim',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  myPlantItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Itim',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                if (myPlantItem
                                                    .wateringReminders)
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .getWaterInXDaysString(
                                                              myPlantItem
                                                                  .lastWatered!,
                                                              myPlantItem
                                                                  .wateringFrequency),
                                                      'Loading...',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Itim',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                if (myPlantItem
                                                    .fertilizerReminders)
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions.getFertilizeInXDaysString(
                                                          myPlantItem
                                                              .lastFertilized!,
                                                          myPlantItem
                                                              .fertilizerFrequencyInDays),
                                                      'Loading...',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                            ),
                          );
                        },
                      ),
                      if (_model.myPlants.isEmpty)
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Text(
                            _model.loadingMyPlants
                                ? 'Loading Your Plants...'
                                : 'To add a plant, click the + button below',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Itim',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      key: const ValueKey('NewPlant_zypi'),
                      onPressed: () async {
                        logFirebaseEvent('MY_PLANTS_PAGE_NewPlant_ON_TAP');
                        logFirebaseEvent('NewPlant_navigate_to');

                        context.pushNamed(
                          'PlantSearch',
                          queryParameters: {
                            'addPlantMode': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );

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
              ].divide(const SizedBox(height: 2.0)),
            ),
          ),
        ),
      ),
    );
  }
}
