import 'package:flutter/material.dart';
import 'package:flutter_tiktok_ui/src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok',
      theme: ThemeData.dark(),
      home: App(),
    );
  }
}
