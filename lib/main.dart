import 'package:flutter/material.dart';
import 'pages/init.dart';
import 'package:get/get.dart';
import 'controllers/controller.dart';

void main() {
  Get.lazyPut<Controller>(() => Controller());
  runApp(const RegemotorApp());
}

class RegemotorApp extends StatelessWidget {
  const RegemotorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pantalla Principal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Init(),
    );
  }
}