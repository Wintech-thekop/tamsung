import 'package:flutter/material.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  List table = [
    {'number': 'โต๊ะ1', 'seat': 'นั่งได้ 4 คน'},
    {'number': 'โต๊ะ2', 'seat': 'นั่งได้ 6 คน'},
    {'number': 'โต๊ะ3', 'seat': 'นั่งได้ 2 คน'},
    {'number': 'โต๊ะ4', 'seat': 'นั่งได้ 4 คน'},
    {'number': 'โต๊ะ5', 'seat': 'นั่งได้ 8 คน'},
    {'number': 'โต๊ะ6', 'seat': 'นั่งได้ 10 คน'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: table.length,
                  itemBuilder: (context, index) =>
                      Table(table: table, index: index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Table({required table, required index}) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Color(0xFF65CCD8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  table[index]['number'],
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  table[index]['seat'],
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Color(0xFF082BDE),
          ),
        ],
      ),
    );
  }
}