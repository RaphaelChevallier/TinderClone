import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:flutter_radar/flutter_radar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tinder_clone/auth/auth_gate.dart';

import 'themes/dark_mode.dart';
import 'themes/light_mode.dart';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
const radarPublicKey = String.fromEnvironment('RADAR_PK');

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await Radar.initialize(radarPublicKey);
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformTheme(
        materialLightTheme: lightMode,
        cupertinoLightTheme: lightModeCupertino,
        materialDarkTheme: darkMode,
        cupertinoDarkTheme: darkModeCupertino,
        builder: (context) => const PlatformApp(
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            title: 'Tinder_Clone',
            debugShowCheckedModeBanner: false,
            home: AuthGate()),
      ),
    );
  }
}
