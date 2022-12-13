import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initialize();

  Widget mainView = const LoginScreensView();
  // if (FirebaseAuth.instance.currentUser != null) {
  //   mainView = Container();
  // }

  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainView,
    ),
  );
}
