import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: const Color(0xFFB1D7BE),
          child: Image.asset(
            'assets/images/plantLogo_(1).png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'PlantSearch': (data) async => ParameterData(
        allParams: {
          'addPlantMode': getParameter<bool>(data, 'addPlantMode'),
        },
      ),
  'MyPlants': ParameterData.none(),
  'PlantConfirmationPage': (data) async => ParameterData(
        allParams: {
          'myPlant': await getDocumentParameter<MyPlantsRecord>(
              data, 'myPlant', MyPlantsRecord.fromSnapshot),
          'backToHomePage': getParameter<bool>(data, 'backToHomePage'),
        },
      ),
  'SignupPage': ParameterData.none(),
  'ProfileCreationPage': ParameterData.none(),
  'PlantInfo': (data) async => ParameterData(
        allParams: {
          'permapeopleId': getParameter<int>(data, 'permapeopleId'),
          'myPlant': await getDocumentParameter<MyPlantsRecord>(
              data, 'myPlant', MyPlantsRecord.fromSnapshot),
          'addPlantMode': getParameter<bool>(data, 'addPlantMode'),
        },
      ),
  'tasks': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'PlantSearch2': (data) async => ParameterData(
        allParams: {
          'searchValue': getParameter<String>(data, 'searchValue'),
          'searchedPlants': getParameter<String>(data, 'searchedPlants'),
        },
      ),
  'sample': ParameterData.none(),
  'DiseaseResults': (data) async => const ParameterData(
        allParams: {},
      ),
  'DiseaseInfo': (data) async => const ParameterData(
        allParams: {},
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
