import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ipi_app/pages/about_app_info.dart';

import 'package:ipi_app/pages/login_page.dart';
import 'package:ipi_app/pages/homescreen.dart';
import 'package:ipi_app/primitives/profile.dart';
//test

void main() {
  // Тестовая инициализация синглтона
  Profile.instance.photoUrl = 'https://i.pinimg.com/736x/d9/d1/c1/d9d1c1f7623af48383c97bc22256fdef.jpg';
  Profile.instance.fullName = 'Джосан Никита Денисович';
  Profile.instance.groupName = 'RF22DR62PI';
  Profile.instance.groupNumber = '320';
  Profile.instance.phoneNumber = '+37377546199';
  Profile.instance.emailAdress = 'DjosanNikitaD@gmail.com';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home' : (context) => const HomeScreen(),
        '/appinfo' : (context) => const AboutAppInfo(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru',''),
      ],
    );
  }
}

