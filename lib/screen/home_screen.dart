import 'dart:ui';

import 'package:flutter/material.dart';

import 'beverage_screen.dart';
import 'order_status_screen.dart';
import 'ordering_screen.dart';
import 'select_food.dart';
import 'select_seat.dart';
import 'statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List menuItems = [
    {
      'item': 'รายการอาหาร',
      'color': Colors.teal[100],
      'icon': Icons.list_alt,
      'screen': SelectFood(),
    },
    {
      'item': 'รายการเครื่องดื่ม',
      'color': Colors.teal[200],
      'icon': Icons.local_drink,
      'screen': BeverageScreen(),
    },
    {
      'item': 'สถานะคำสั่งซื้อ',
      'color': Colors.teal[300],
      'icon': Icons.book,
      'screen': OrderStatusScreen(),
    },
    {
      'item': 'เมนูที่กำลังทำ',
      'color': Colors.teal[400],
      'icon': Icons.food_bank,
      'screen': OrderingScreen(),
    },
    {
      'item': 'สถิติรายการอาหาร',
      'color': Colors.teal[500],
      'icon': Icons.list_sharp,
      'screen': StatisticsScreen(),
    },
    {
      'item': 'จำนวนที่นั่ง',
      'color': Colors.teal[600],
      'icon': Icons.event_seat,
      'screen': SelectSeat(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('วินเทคโภชนา',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'fonttintinver2update',
            fontWeight: FontWeight.bold,
          ),)),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuItems[index]['screen'],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: menuItems[index]['color'],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(menuItems[index]['icon'], size: 60),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            menuItems[index]['item'],
                            style: const TextStyle(
                              fontSize: 26,
                              fontFamily: 'fonttintinver2update',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
