import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/homa_page.dart';

void main() async {
  // initialize Hive
  await Hive.initFlutter();
// Open the Hive box
  await Hive.openBox('mybox');
  var box = Hive.box('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
