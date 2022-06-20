import 'package:counter_riverpod/provider/counter_provider.dart';
import 'package:counter_riverpod/another_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/constants.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterHomePage(title: Constants.kTitle),
      ),
    );
  }
}

// extends ConsumerWidget to expose WidgetRef so that we can access our provider.
class CounterHomePage extends ConsumerWidget {
  final String title;
  const CounterHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //there's no need to use select here because we only have one, which is the counter value.
    final counterRef = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              //resets to the original value
              ref.refresh(counterProvider);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Constants.kPushButtonManyTimes(counterRef.counter),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnotherPage()));
                },
                child: const Text(Constants.kNextPage)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider).increment();
        },
        tooltip: Constants.kIncrement,
        child: const Icon(Icons.add),
      ),
    );
  }
}
