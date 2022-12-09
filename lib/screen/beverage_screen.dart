import 'package:flutter/material.dart';

class BeverageScreen extends StatefulWidget {
  const BeverageScreen({super.key});

  @override
  State<BeverageScreen> createState() => _BeverageScreenState();
}

class _BeverageScreenState extends State<BeverageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายการเครื่องดื่ม',style: TextStyle(
            fontSize: 24,
            fontFamily: 'fonttintinver2update',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
