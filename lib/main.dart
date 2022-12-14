import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/core/const/color_constants.dart';
import 'package:flutter_firebase/screens/onboarding/page/onboarding_page.dart';
import 'package:flutter_firebase/screens/tab_bar/page/tab_bar_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   final isLoggedIn = FirebaseAuth.instance.currentUser != null;
 
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Fitness assistant',
     theme: ThemeData(
       textTheme:
           TextTheme(bodyText1: TextStyle(color: ColorConstants.textColor)),
       fontFamily: 'NotoSansKR',
       scaffoldBackgroundColor: Colors.white,
       visualDensity: VisualDensity.adaptivePlatformDensity,
     ),
     home: isLoggedIn ? TabBarPage() : OnboardingPage(),
   );
 }
}