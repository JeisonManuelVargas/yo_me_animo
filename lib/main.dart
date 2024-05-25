import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yo_me_animo/core/util/app_theme.dart';
import 'package:yo_me_animo/firebase_options.dart';
import 'package:yo_me_animo/injection_container.dart' as di;
import 'package:yo_me_animo/core/navigation/navigator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(context),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.generateRoute,
    );
  }
}
