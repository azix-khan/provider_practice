import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  double value = 0.1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Provider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(value: value, onChanged: (value) {}),
          Expanded(
              child: Row(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: Text('Conatiner 1'),
              )
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text('Conatiner 2'),
              )
            ],
          )),
        ],
      ),
    );
  }
}
