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
    await tester.tap(find.byKey(ValueKey('Tab_smwq')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginEmailBar_p9f0')), 'test70@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginPasswordBar_bggu')), 'pass123!');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('LoginButton_11vw')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    expect(find.byKey(ValueKey('Text_pybc')), findsOneWidget);
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
    await tester.tap(find.byKey(ValueKey('Tab_smwq')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginEmailBar_p9f0')), 'test70@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginPasswordBar_bggu')), 'pass123!!');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('LoginButton_11vw')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    expect(find.byKey(ValueKey('LoginButton_11vw')), findsOneWidget);
  });

  testWidgets('URLFunctionality', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('Tab_smwq')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginEmailBar_p9f0')), 'jaed.flores3@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(
        find.byKey(ValueKey('LoginPasswordBar_bggu')), 'EdJa2003.');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('LoginButton_11vw')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 3000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('dropdown_menu_sf3g')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.text('Plant Search'));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('IconButton_esn9')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('Button_lohe')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('ImageURL_a4rt')),
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Lilium_longiflorum_%28Easter_Lily%29.JPG/1200px-Lilium_longiflorum_%28Easter_Lily%29.JPG');
    await tester.tap(find.byKey(ValueKey('Button_f8eq')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    expect(
      tester
          .widget<FFButtonWidget>(find.byKey(ValueKey('Button_lohe')))
          .onPressed,
      isNotNull,
    );
  });

  testWidgets('Golden Path', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test70@gmail.com', password: 'pass123!');
    await tester.pumpWidget(MyApp(
      entryPage: HomePageWidget(),
    ));

    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('dropdown_menu_sf3g')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.text('My Plants'));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('NewPlant_zypi')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('SearchBar_nvwl')), 'car');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('SearchBar_nvwl')), 'carrot');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('SearchBar_nvwl')), 'carro');
    await tester.pumpAndSettle(
      Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.text('Daucus Carota Sativus'));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('Button_p6sd')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.enterText(find.byKey(ValueKey('Nickname_vtoj')), 'Carroty');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    await tester.tap(find.byKey(ValueKey('Button_476r')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 300000),
    );
    expect(find.text('Carroty'), findsOneWidget);
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
