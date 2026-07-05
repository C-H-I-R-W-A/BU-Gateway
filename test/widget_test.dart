// This is a basic Flutter widget test for BU Gateway.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bu_gateway/app.dart';

void main() {
  testWidgets('BU Gateway UI smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BuGatewayApp());

    // Verify that the title 'BU Gateway' is displayed.
    expect(find.text('BU Gateway'), findsOneWidget);

    // Verify that the search bar is present.
    expect(find.byType(TextField), findsOneWidget);
  });
}

