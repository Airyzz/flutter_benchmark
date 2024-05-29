import 'package:flutter/material.dart';
import 'package:flutter_benchmark/scroll_benchmark.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ScrollBenchmark());

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('end'));

    await binding.traceAction(
      () async {
        // Scroll until the item to be found appears.
        await tester.scrollUntilVisible(
          itemFinder,
          50.0,
          maxScrolls: 1000,
          scrollable: listFinder,
        );
      },
      reportKey: 'scrolling_timeline',
    );
  });
}
