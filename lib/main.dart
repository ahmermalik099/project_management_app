import 'package:flutter/material.dart';
import 'package:project_management_app/onBoard/onBoardScreen.dart';
import 'package:project_management_app/preApp/pre_app.dart';
import 'package:project_management_app/provider/provider.dart';
import 'package:provider/provider.dart';

import 'Navbar/navbar-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProjectProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/checkScreen',
      routes: {
        '/checkScreen': (context) => CheckScreen(),
        '/bottomNavBar': (context) => NavBarScreen(),
        '/onBoarding': (context) => OnboardingPage(),

      },
      //home: CheckScreen(),
    );
  }
}
