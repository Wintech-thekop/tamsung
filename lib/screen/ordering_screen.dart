import 'package:flutter/material.dart';


class OrderingScreen extends StatefulWidget {
  const OrderingScreen({super.key});

  @override
  State<OrderingScreen> createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูที่กำลังทำ',style: TextStyle(
            fontSize: 24,
            fontFamily: 'fonttintinver2update',
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}
