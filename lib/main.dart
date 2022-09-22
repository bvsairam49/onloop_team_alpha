import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:team_alpha/screens/login_screen.dart';

import 'Screens/home_screen.dart';
import 'model/app_state.dart';

void main() {
  runOnloopApp();
  runApp(const MyApp());
}

Future<void> runOnloopApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;

  final appState = AppState();
  getIt.registerSingleton<AppState>(appState);

  // final apiService = ApiService();
  // getIt.registerSingleton<ApiService>(apiService);

  // Inject dependencies and run the app.
  // runApp(
  //   DefaultAssetBundle(
  //     bundle: SentryAssetBundle(),
  //     child: MultiProvider(providers: [
  //       ChangeNotifierProvider.value(value: appState),
  //       ChangeNotifierProvider.value(value: allColleaguesRepo),
  //       ChangeNotifierProvider.value(value: homeScreenMetricsRepo),
  //       ChangeNotifierProvider.value(value: learnFeedRepo),
  //       ChangeNotifierProvider(
  //         create: (_) => FeatureFlag(
  //           appVersion: appVersion.toString(),
  //         ),
  //       ),
  //     ], child: app),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
