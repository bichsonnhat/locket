import 'package:flutter/material.dart';
import 'package:locket/pages/login.dart';
import 'package:locket/pages/rive_login_screen.dart';
import 'package:locket/src/rust/api/simple.dart';
import 'package:locket/src/rust/frb_generated.dart';


Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiveLoginScreen()
    );
  }
}
