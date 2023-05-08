import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moniepoint/ui/utilities/palette.dart';
import 'package:moniepoint/ui/views/tabbed_home/tabbed_home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    _initSystemUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moniepoint',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Montserrat"),
      home: const TabbedHome(),
    );
  }
}

void _initSystemUI() {
  // Configure preferred orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Configure status bar appearance
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Only honored in Android. Ensure dark icons/texts on the status bar along
    // with transparent status bar background
    statusBarColor: Palette.white,
    statusBarIconBrightness: Brightness.dark,
    // Only honored in iOS. Ensure dark icons and texts on the status bar
    statusBarBrightness: Brightness.light,
  ));
}
