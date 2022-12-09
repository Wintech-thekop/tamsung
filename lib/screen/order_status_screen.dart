import 'package:flutter/material.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สถานะคำสั่งซื้อ',style: TextStyle(
            fontSize: 24,
            fontFamily: 'fonttintinver2update',
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}
