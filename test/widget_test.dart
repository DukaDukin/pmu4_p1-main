import 'package:flutter_test/flutter_test.dart';
import 'package:pmu4_p1/main.dart';

void main() {
  testWidgets('Aplikacija prikazuje naslov Objave', (WidgetTester tester) async {
    await tester.pumpWidget(const ObjaveApp());

    expect(find.text('Objave'), findsOneWidget);
  });
}
