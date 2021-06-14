import 'package:customer_app/screens/bottom_tabs.dart';
import 'package:customer_app/screens/customer_login_screen.dart';
import 'package:customer_app/screens/customer_registration_screen.dart';
import 'package:customer_app/screens/factor_screen.dart';
import 'package:customer_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/welcome_screen.dart';
import 'package:customer_app/screens/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapFood',
      initialRoute: WelcomeScreen.welcomeScreenId,
      routes: {
        WelcomeScreen.welcomeScreenId : (context) => WelcomeScreen(registrationRouteName: CustomersRegistrationScreen.customersRegistrationId,loginRouteName: LoginScreen.loginScreenId,),
        BottomTabs.bottomTabsId : (context) => BottomTabs(),
        CustomersRegistrationScreen.customersRegistrationId : (context) => CustomersRegistrationScreen(),
        LoginScreen.loginScreenId : (context) => LoginScreen(),
        FactorScreen.factorScreenId : (context) => FactorScreen(),
        Map.MapId : (context) => Map(),
        ProfilePage.profileId : (context) => ProfilePage(),
      },
      theme: ThemeData(
        primaryColor: const Color(0XFFd83e56),
        accentColor: const Color(0XFFd83e56),
      ),
    );
  }
}