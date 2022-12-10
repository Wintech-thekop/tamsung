import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:tamsang/provider/store.dart';

class SelectFood extends StatefulWidget {
  const SelectFood({super.key});

  @override
  State<SelectFood> createState() => _SelectFoodState();
}

class _SelectFoodState extends State<SelectFood> {
  int checkRepaet = 0;
  List listFoods = [];

  List dropDownFoods = [
    {
      'pic': 'เมนู',
      'name': 'ผัดกระเพรา',
      'price': '50',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดคะน้า',
      'price': '55',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดไท',
      'price': '40',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดซีอิ้ว',
      'price': '40',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ราดหน้า',
      'price': '40',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ผัดขี้เมา',
      'price': '55',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ก๋วยเตี๋ยว',
      'price': '40',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ส้มตำ',
      'price': '35',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ต้มยำกุ้ง',
      'price': '65',
      'count': 0,
      'sum': 0,
    },
    {
      'pic': 'เมนู',
      'name': 'ต้มเล้ง',
      'price': '80',
      'count': 0,
      'sum': 0,
    },
  ];

  String? dropDown;
  Object? addMenu;

  @override
  Widget build(BuildContext context) {
    int sumAll = 0;
    var provider = context.watch<Store>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'รายการอาหาร',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'fonttintinver2update',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    hint: const Text(
                      "กรุณาเลือกเมนู",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'fonttintinver2update',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: dropDown,
                    items: dropDownFoods
                        .map(
                          (item) => DropdownMenuItem(
                            onTap: () => setState(() => addMenu = item),
                            value: item['name'],
                            child: Text(
                              item['name'],
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'fonttintinver2update',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        dropDown = item.toString();
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      checkRepaet = 0;

                      listFoods
                          .map((e) => e == addMenu ? checkRepaet++ : null)
                          .toList();
                      if ((dropDown != null) && (checkRepaet == 0)) {
                        listFoods.add(addMenu);
                      }
                    }),
                    child: const Text(
                      'เลือก',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'fonttintinver2update',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listFoods.length,
                itemBuilder: (context, index) => ListFood(
                    listFood: listFoods,
                    index: index,
                    provider: provider,
                    sumAll: sumAll),
              ),
            ),
            Card(
              child: Container(
                color: Color(0xFF54AF54),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ยอดรวม',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'fonttintinver2update',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '             จำนวนเงิน',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'fonttintinver2update',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${provider.sumAll}  บาท',
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'fonttintinver2update',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'ยืนยันเมนูอาหาร',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'fonttintinver2update',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Row ListFood(
      {required listFood, required index, required provider, required sumAll}) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Text(listFood[index]['pic']),
            title: Text(
              listFood[index]['name'],
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'fonttintinver2update',
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              listFood[index]['price'] + ' บาท',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'fonttintinver2update',
              ),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  provider.decreaseCount(listFoods[index]);
                  setState(() {
                    listFood[index]['count'] = provider.count;
                    listFood[index]['sum'] = provider.sum;
                    sumAll = 0;
                    for (var i = 0; i < listFood.length; i++) {
                      sumAll = sumAll + listFood[i]['sum'];
                      provider.priceSum(sumAll);
                    }
                  });
                },
                icon: const Icon(Icons.remove)),
            Text(
              listFood[index]['count'].toString(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'fonttintinver2update',
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                onPressed: () {
                  provider.increaseCount(listFoods[index]);
                  setState(() {
                    listFood[index]['count'] = provider.count;
                    listFood[index]['sum'] = provider.sum;
                    sumAll = 0;
                    for (var i = 0; i < listFood.length; i++) {
                      sumAll = sumAll + listFood[i]['sum'];
                      provider.priceSum(sumAll);
                    }
                  });
                },
                icon: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
