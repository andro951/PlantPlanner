import 'package:app_settings/app_settings.dart';
import 'package:location/location.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
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

  double lattitude = 0.0000;
  double longitude = 0.0000;

  @override
  void initState() {
    super.initState();
    getUserCurrentLocation();
    _model = createModel(context, () => MyPlantsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyPlants'});
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MY_PLANTS_PAGE_SIGNOUT_BTN_ON_TAP');
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('LoginPage', context.mounted);
                    },
                    text: 'Signout',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).buttonColor,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<MyPlantsRecord>>(
                          stream: queryMyPlantsRecord(
                            parent: currentUserReference,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<MyPlantsRecord> listViewMyPlantsRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewMyPlantsRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 2.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewMyPlantsRecord =
                                    listViewMyPlantsRecordList[listViewIndex];
                                return Container(
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
                                            'https://picsum.photos/seed/45/600',
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
                                                listViewMyPlantsRecord.nickname,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Itim',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                listViewMyPlantsRecord.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Itim',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.getWaterInXDaysString(
                                                      listViewMyPlantsRecord
                                                          .lastWatered!,
                                                      listViewMyPlantsRecord
                                                          .wateringFrequency),
                                                  'WaterInXDays',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Itim',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              if (listViewMyPlantsRecord
                                                  .fertilizerReminders)
                                                Text(
                                                  functions
                                                      .getFertilizeInXDaysString(
                                                          listViewMyPlantsRecord
                                                              .lastFertilized!,
                                                          listViewMyPlantsRecord
                                                              .fertilizerFrequencyInDays),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Itim',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              Text(
                                                listViewMyPlantsRecord.indoor
                                                    ? 'Indoor'
                                                    : 'Outside',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                      ],
                    ),
                  ),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).buttonColor,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


getUserCurrentLocation() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      // Handle the case where user did not enable location service
      normalConfirmationDialog(
        "Location service is disabled. App wants to access your location",
        "Please enable your location",
        "Enable Location",
      );
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      // Handle the case where user denied the permission
      normalConfirmationDialog(
        "Denied the location permission. Please go to settings and give access",
        "Location permission denied",
        "Open settings"
      );
      print("Location_Permission_Denied");
      return;
    }
  }
  location.onLocationChanged.listen((LocationData currentLocation) async {
    // Handle location updates here
    print("Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
    setState(() {
      lattitude = currentLocation.latitude!;
      longitude = currentLocation.longitude!;
    });

  });
}

  normalConfirmationDialog(String confirmationText, String title, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0),
              Text(title, style: const TextStyle(fontSize: 20.0,),),
              const SizedBox(height: 20.0),
              Text(confirmationText,),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: (){
                  if(buttonText == "Open settings"){
                    AppSettings.openAppSettings();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(buttonText),
                )
            ],
          )
        );
      },
    );
  }
}