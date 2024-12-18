import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dropdown_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      logFirebaseEvent('HomePage_set_form_field');
      safeSetState(() {
        _model.dropdownMenuModel.dropDownValueController?.value = 'Home Page';
      });
      logFirebaseEvent('HomePage_action_block');
      await _model.getMyPlants(context);
      logFirebaseEvent('HomePage_update_page_state');
      _model.loadingNotifications = false;
      safeSetState(() {});
      logFirebaseEvent('HomePage_start_periodic_action');
      _model.oneSecTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('HomePage_update_page_state');
          _model.myPlantsRefreshTimer = _model.myPlantsRefreshTimer + 1;
          if (_model.myPlantsRefreshTimer >= 5) {
            logFirebaseEvent('HomePage_action_block');
            await _model.getMyPlants(context);
            logFirebaseEvent('HomePage_update_page_state');
            _model.myPlantsRefreshTimer = 0;
            safeSetState(() {});
          } else {
            logFirebaseEvent('HomePage_update_page_state');

            safeSetState(() {});
          }
        },
        startImmediately: true,
      );
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
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: wrapWithModel(
                            model: _model.dropdownMenuModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: const DropdownMenuWidget(
                              key: ValueKey('dropdown_menu_sf3g'),
                              myPage: 'Home Page',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_Stack_fkne7ldz_ON_TAP');
                            logFirebaseEvent('Stack_navigate_to');

                            context.pushNamed('ProfileCreationPage');
                          },
                          child: Stack(
                            children: [
                              if (currentUserPhoto == '')
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/user-profile-icon-free-vector.jpg',
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              if (currentUserPhoto != '')
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 80.0,
                                      height: 80.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        currentUserPhoto,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 70.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                key: const ValueKey('Text_pybc'),
                                'Welcome, $currentUserDisplayName!',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/plantLogo_(1).png',
                              width: MediaQuery.sizeOf(context).width * 0.67,
                              height: 200.0,
                              fit: BoxFit.cover,
                              alignment: const Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final notification =
                                      _model.notifications.toList();

                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      logFirebaseEvent(
                                          'HOME_ListView_f5uhkjs6_ON_PULL_TO_REFRES');
                                      logFirebaseEvent('ListView_action_block');
                                      await _model.getMyPlants(context);
                                      safeSetState(() {});
                                    },
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: notification.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 2.0),
                                      itemBuilder:
                                          (context, notificationIndex) {
                                        final notificationItem =
                                            notification[notificationIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Container_f2z9u0bq_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_backend_call');
                                            _model.myPlantDoc =
                                                await MyPlantsRecord
                                                    .getDocumentOnce(
                                                        notificationItem
                                                            .myPlant!);
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'PlantConfirmationPage',
                                              queryParameters: {
                                                'myPlant': serializeParam(
                                                  _model.myPlantDoc,
                                                  ParamType.Document,
                                                ),
                                                'backToHomePage':
                                                    serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'myPlant': _model.myPlantDoc,
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 64.0,
                                                  height: 64.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        _model.images
                                                            .elementAtOrNull(
                                                                notificationIndex),
                                                        'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                                      ),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          notificationItem.name,
                                                          'name',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          notificationItem
                                                              .description,
                                                          'description',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
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
                              if (_model.notifications.isEmpty)
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    _model.loadingNotifications
                                        ? 'Loading Notifications...'
                                        : 'Add plants in My Plants to see your care notifications here.',
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
                      ].divide(const SizedBox(height: 2.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
