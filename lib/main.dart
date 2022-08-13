import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'consts/styles.dart';
import 'providers/theme_provider.dart';
import 'screens/homescreen.dart';
import 'screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //for oriantation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //for full screen

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();
  void checkCurrentTheme() async {
    themeProvider.setTheme = await themeProvider.themePrefrences.getTheme();
  }

  @override
  void initState() {
    checkCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        }),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Music Player',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
