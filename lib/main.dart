import 'package:bankwallet/screens/spender.dart';
import 'package:bankwallet/screens/transfer.dart';
import 'package:flutter/material.dart';
import 'package:bankwallet/screens/dashboard.dart'; // make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
