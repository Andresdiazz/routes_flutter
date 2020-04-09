import 'package:flutter/material.dart';
import 'package:routesapp/src/views/hero.dart';
import 'package:routesapp/src/views/hero_second.dart';
import 'package:routesapp/src/views/home_page.dart';
import 'package:routesapp/src/views/image_picker.dart';
import 'package:routesapp/src/views/second_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(),
      initialRoute: "/",
      routes: {
        "/":(BuildContext context)=> MyHomePage(),
        "/second": (BuildContext context) => SecondPage()
      },
    );
  }
}