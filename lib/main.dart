import 'package:bynryapp/authentication/firebaseAuth/authPage.dart';
import 'package:bynryapp/authentication/login/login.dart';
import 'package:bynryapp/firebase_options.dart';
import 'package:bynryapp/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const AuthPage(),
      routes: {'/login': (context) => LoginScreen()},
    );
  }
}
