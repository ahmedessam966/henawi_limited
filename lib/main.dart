import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:henawi_limited/Global/Screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationServices()),
          ChangeNotifierProvider(create: (_) => ThemeModeServices()),
          ChangeNotifierProvider(create: (_) => LocaleRouter()),
          ChangeNotifierProvider(create: (_) => LoginScreenControllers()),
          ChangeNotifierProvider(create: (_) => InterfaceIdentifierServices()),
          ChangeNotifierProvider(create: (_) => ThemeConstants()),
          ChangeNotifierProvider(create: (_) => NotificationServices()),
          ChangeNotifierProvider(create: (_) => SalesAgentController()),
          ChangeNotifierProvider(create: (_) => SalesManagerController()),
        ],
        builder: (context, child) {
          final themeNotifier = context.watch<ThemeModeServices>();
          final themeConstants = context.watch<ThemeConstants>();

          return MaterialApp(
            title: 'Henawi Limited',
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.selectedTheme,
            theme: themeNotifier.selectedTheme == ThemeMode.light
                ? themeConstants.lightThemeData
                : themeConstants.darkThemeData,
            home: EasySplashScreen(
              showLoader: true,
              logo: Image.asset(
                'assets/images/logo-no-background.png',
                fit: BoxFit.cover,
              ),
              logoWidth: 250,
              durationInSeconds: 5,
              loadingText: const Text(
                'Starting Services',
                style: TextStyle(color: Colors.black),
              ),
              navigator: const LoginScreen(),
            ),
          );
        });
  }
}
