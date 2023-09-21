import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier(0);
  ValueNotifier<bool> toggle = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password visibiliy, use stl as stf'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffix: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                  ),
                );
              }),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      _counter.value.toString(),
                      style: const TextStyle(fontSize: 50),
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
