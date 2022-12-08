import 'dart:ui';

import 'package:flutter/material.dart';

import 'select_food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List menuItems = [
    {'item': 'รายการอาหาร', 'color': Colors.teal[100], 'icon': Icons.list_alt},
    {
      'item': 'เครื่องดื่ม',
      'color': Colors.teal[200],
      'icon': Icons.local_drink
    },
    {'item': 'สถานะคำสั่งซื้อ', 'color': Colors.teal[300], 'icon': Icons.book},
    {
      'item': 'เมนูที่กำลังทำ',
      'color': Colors.teal[400],
      'icon': Icons.food_bank
    },
    {'item': 'สถิติ', 'color': Colors.teal[500], 'icon': Icons.list_sharp},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SelectFood()),
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
                            style: const TextStyle(fontSize: 20),
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
