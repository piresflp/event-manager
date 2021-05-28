import 'package:Even7/pages/EventDetails/EventDetailsPage.dart';
import 'package:Even7/theme/colors.dart';
import 'LoginPage.dart';
import 'pages/RootApp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Even7',
      initialRoute: '/login',
      routes: {'/': (context) => RootApp(), '/login': (context) => LoginPage()},
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
