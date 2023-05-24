import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:izone_user/constants/provider.dart';
import 'package:izone_user/view/bottom%20_navbar.dart';
import 'package:izone_user/view/profile_screen/profile_screen.dart';
// import 'package:izone_user/view/splash_screen.dart';
import 'package:izone_user/view/splash_screen/spalsh_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashScreen(),
      ),
    );
  }
}
