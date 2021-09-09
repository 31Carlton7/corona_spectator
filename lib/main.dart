import 'package:canton_design_system/canton_design_system.dart';
import 'package:corona_spectator/src/config/constants.dart';
import 'package:corona_spectator/src/ui/views/current_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox('corona_spectator');

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  /// Lock screen orientation to vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CantonApp(
      title: kAppTitle,
      primaryLightColor: CantonColors.purple,
      primaryDarkColor: CantonDarkColors.purple,
      primaryLightVariantColor: CantonColors.purple[400]!,
      primaryDarkVariantColor: CantonDarkColors.purple[400]!,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      home: CurrentView(),
    );
  }
}
