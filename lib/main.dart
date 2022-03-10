
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/responsive/Responsive.dart';
import 'package:instaclone/responsive/mobile_screen_layout.dart';
import 'package:instaclone/responsive/web_screen_layout.dart';
import 'package:instaclone/utils/colors.dart';
import 'auth/.secrets.dart';
import 'screens/login.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: apikey,
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
          storageBucket: storageBucket,
          ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instaclone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //     mobileScreenLayout: MobileScreenLayout(),
      //     webScreenLayout: WebScreenLayout()
      //     ),
      home: LoginScreen(),
    );
  }
}
