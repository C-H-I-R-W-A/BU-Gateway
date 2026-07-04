import 'package:flutter_test/flutter_test.dart';
import 'package:bu_gateway/app.dart'; // Import app.dart where BUApp lives

void main() {
  testWidgets('Splash screen branding smoke test', (WidgetTester tester) async {
    // Build our updated app and trigger a frame.
    await tester.pumpWidget(const BUApp());

    // Verify that the application branding text elements render correctly.
    expect(find.text('BU Gateway'), findsOneWidget);
    expect(find.text('Bugema University Companion Portal'), findsOneWidget);
    
    // Verify that the old counter template elements are gone.
    expect(find.text('0'), findsNothing);
  });
}