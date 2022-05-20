import 'package:demo_rest_api/use_getx/home_page_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'non_getx/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageGetX(),
    );
  }
}