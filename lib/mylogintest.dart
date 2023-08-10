import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_waste_management/login.dart';
import 'package:smart_waste_management/dashboard.dart';

void main() {
  testWidgets('Entering correct credentials navigates to dashboard', (WidgetTester tester) async {
    // Build the MyLogin widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyLogin()));

    // Enter correct email and password.
    await tester.enterText(find.byType(TextField).first, 'user1@email.com');
    await tester.enterText(find.byType(TextField).last, 'password123');
    await tester.tap(find.text('LOG IN')); // Simulate tapping the LOG IN button
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Check if the navigation to the dashboard occurred.
    expect(find.byType(DashboardApp), findsOneWidget);
  });

 testWidgets('Entering incorrect credentials shows error dialog', (WidgetTester tester) async {
    // Build the MyLogin widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyLogin()));

    // Enter incorrect email and password.
    await tester.enterText(find.byType(TextField).first, 'incorrect@email.com');
    await tester.enterText(find.byType(TextField).last, 'wrongpassword');
    await tester.tap(find.text('LOG IN')); // Simulate tapping the LOG IN button
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Check if the error dialog is displayed.
    expect(find.text('Login Failed'), findsOneWidget);
    expect(find.text('Invalid email or password.'), findsOneWidget);

    // Check that the DashboardApp widget is not present (test fails).
    expect(find.byType(DashboardApp), findsNothing);
  });

    testWidgets('Entering incorrect credentials fails the test', (WidgetTester tester) async {
    // Build the MyLogin widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyLogin()));

    // Enter incorrect email and password.
    await tester.enterText(find.byType(TextField).first, 'incorrect@email.com');
    await tester.enterText(find.byType(TextField).last, 'wrongpassword');
    await tester.tap(find.text('LOG IN')); // Simulate tapping the LOG IN button
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Add an assertion that will fail, causing the test to fail.
    expect(false, isTrue);
  });
}
