import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/store.dart';
import 'screen/home_screen.dart';
import 'screen/select_food.dart';
import 'screen/select_seat.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => Store()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const HomeScreen(),
    );
  }
}
