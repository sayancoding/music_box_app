import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/const/Color.dart';
import 'package:music_box/views/HomeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Music Box',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => const Homeview()
      },
    );
  }
}

