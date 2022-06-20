import 'package:counter_riverpod/main.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';

class AnotherPage extends StatelessWidget {
  const AnotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CounterHomePage(title: Constants.kTitle)));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
          child: Text(
        Constants.kAnotherPage,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
