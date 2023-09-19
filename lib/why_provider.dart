import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({Key? key}) : super(key: key);

  @override
  State<WhyProvider> createState() => _StateFulWidgetState();
}

class _StateFulWidgetState extends State<WhyProvider> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Practice / why pprovider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Center(
                child: Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
              style: const TextStyle(fontSize: 50),
            )),
          ),
          Card(
            child: Center(
                child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 50),
            )),
          ),
        ],
      ),
    );
  }
}
