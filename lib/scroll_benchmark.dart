import 'package:flutter/material.dart';

void main() {
  runApp(const ScrollBenchmark());
}

class ScrollBenchmark extends StatelessWidget {
  const ScrollBenchmark({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int count = 500;

  int fibonacci(int n) {
    if (n <= 1) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 == 0
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.secondaryContainer,
              child: SizedBox(
                height: ((index % 5) + 1) * 20,
                child: Center(
                  child: Text(
                    // Intentionally try to make this slow, i want to see the impact on build time!
                    'Item: $index  fib: ${fibonacci(1)}',
                    key: index == count - 1 ? ValueKey("end") : null,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
