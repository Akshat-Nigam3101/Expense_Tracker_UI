// ignore_for_file: unused_element, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:my_app/first.dart';
import 'package:my_app/home_screen.dart';
import 'package:my_app/second.dart';
import 'package:my_app/provider/transactions_provider.dart';
import 'dart:math';

import 'model/transaction.dart';

void main() {
  runApp(const PaymentsApp());
}

class PaymentsApp_first extends StatelessWidget {
  const PaymentsApp_first({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090909),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const first_screen(),
        '/home': (context) => const HomeScreen(),
      },
      home: const first_screen(),
    );
  }
}
