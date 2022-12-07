import 'package:flutter/material.dart';

class SelectFood extends StatefulWidget {
  const SelectFood({super.key});

  @override
  State<SelectFood> createState() => _SelectFoodState();
}

class _SelectFoodState extends State<SelectFood> {
  bool check = false;
  List listFoods = [
    {
      'pic': 'เมนู',
      'name': 'ผัดกระเพรา',
      'price': '50',
      'controller': false,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดคะน้า',
      'price': '55',
      'controller': false,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดไท',
      'price': '40',
      'controller': false,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดซีอิ้ว',
      'price': '40',
      'controller': false,
    },
    {
      'pic': 'เมนู',
      'name': 'ราดหน้า',
      'price': '40',
      'controller': false,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดขี้เมา',
      'price': '55',
      'controller': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: listFoods.length,
          itemBuilder: (context, index) =>
              ListFood(listFood: listFoods, index: index),
        ),
      ),
    );
  }

  ListTile ListFood({required listFood, required index}) {
    return ListTile(
      leading: Text(listFood[index]['pic']),
      title: Text(listFood[index]['name']),
      subtitle: Text(listFood[index]['price']+' บาท'),
      trailing: Checkbox(
        value: listFood[index]['controller'],
        onChanged: (value) {
          setState(() {
            listFood[index]['controller'] = !listFood[index]['controller'];
          });
        },
      ),
    );
  }
}
