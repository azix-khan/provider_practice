import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Provider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          })),
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(child: Text('Conatiner 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    child: const Center(child: Text('Conatiner 2')),
                  ),
                ),
              ],
            );
          })),
        ],
      ),
    );
  }
}
