import 'package:boring_app/boring_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routing/routing.dart';
import 'services/loginAuth.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  LoginAuth.prefs = _prefs;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BoringApp(
      themeConfig: BoringThemeConfig(
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            useMaterial3: true),
      ),
      initialLocation: '/',
      sections: Routing.sections,
    );
  }
}
