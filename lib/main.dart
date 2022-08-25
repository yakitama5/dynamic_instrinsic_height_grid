import 'package:flutter/material.dart';
import 'package:sample_grid/app/components/dynamic_intrinsic_height_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final _items = List.generate(
          15,
          (index) => (index % 5 == 0 || index % 11 == 0)
              ? "Item \r\n\r\n\r\n\r\n\r\n\r\n $index"
              : "Item\r\n $index")
      .map((e) => Text(
            e,
            textAlign: TextAlign.center,
          ))
      .toList();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid Sample")),
      body: DynamicInstrinsicHeightGrid(
        childlen: _items,
        runSpacing: 10,
        spacing: 10,
        itemBoxConstraints: const BoxConstraints(maxHeight: 150, minHeight: 75),
      ),
    );
  }
}
