import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:plant_planner/flutter_flow/flutter_flow_drop_down.dart';
import 'package:plant_planner/flutter_flow/flutter_flow_icon_button.dart';
import 'package:plant_planner/flutter_flow/flutter_flow_widgets.dart';
import 'package:plant_planner/flutter_flow/flutter_flow_theme.dart';
import 'package:plant_planner/index.dart';
import 'package:plant_planner/main.dart';
import 'package:plant_planner/flutter_flow/flutter_flow_util.dart';

import 'package:plant_planner/backend/firebase/firebase_config.dart';
import 'package:plant_planner/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:plant_planner/backend/sqlite/sqlite_manager.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await SQLiteManager.initialize();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('User Authentication - Login to existing account - Pass',
      (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('UNDEFINED')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('UNDEFINED')), 'test43@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('UNDEFINED')), 'pass123!');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('UNDEFINED')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    expect(find.text('Signout'), findsOneWidget);
  });

  testWidgets('User Authentication - Login to existing account - Fail',
      (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('UNDEFINED')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('UNDEFINED')), 'test43@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('UNDEFINED')), 'pass123!!');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('UNDEFINED')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    expect(find.text('LOGIN'), findsNWidgets(2));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
