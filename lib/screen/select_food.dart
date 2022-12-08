import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tamsang/provider/store.dart';

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
      'count': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดคะน้า',
      'price': '55',
      'count': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดไท',
      'price': '40',
      'count': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดซีอิ้ว',
      'price': '40',
      'count': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ราดหน้า',
      'price': '40',
      'count': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดขี้เมา',
      'price': '55',
      'count': 0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<Store>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listFoods.length,
          itemBuilder: (context, index) =>
              ListFood(listFood: listFoods, index: index, provider: provider),
        ),
      ),
    );
  }

  Row ListFood({required listFood, required index, required provider}) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Text(listFood[index]['pic']),
            title: Text(listFood[index]['name']),
            subtitle: Text(listFood[index]['price'] + ' บาท'),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  provider.decreaseCount();
                  setState(() {
                    listFood[index]['count'] = provider.count;
                  });
                }, icon: Icon(Icons.remove)),
            Text(listFood[index]['count'].toString()),
            IconButton(
                onPressed: () {
                  provider.increaseCount();
                  setState(() {
                    listFood[index]['count'] = provider.count;
                  });
                },
                icon: Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
