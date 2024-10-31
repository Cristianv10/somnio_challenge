import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:somnio/presentation/challenge/view/header_widget.dart';
import 'package:somnio/presentation/core/widgets/text_base.dart';

void main() {
  testWidgets('HeaderWidget displays correct texts',
      (WidgetTester tester) async {
    // Act: Construir el HeaderWidget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderWidget(),
        ),
      ),
    );

    // Assert: Verifica que el texto 'Blog' esté presente
    expect(find.text('Blog'), findsOneWidget);
    // Verifica que el texto 'Welcome To Our Blog' esté presente
    expect(find.text('Welcome To Our Blog'), findsOneWidget);
  });

  testWidgets('HeaderWidget has correct text styles',
      (WidgetTester tester) async {
    // Act: Construir el HeaderWidget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeaderWidget(),
        ),
      ),
    );

    // Assert: Verifica que el texto 'Blog' tenga el estilo esperado
    final blogTextFinder = find.byWidgetPredicate(
      (widget) =>
          widget is TextBase &&
          widget.text == 'Blog' &&
          widget.fontSize == 20 &&
          widget.fontWeight == FontWeight.bold &&
          widget.color == Colors.blue,
    );
    expect(blogTextFinder, findsOneWidget);

    // Assert: Verifica que el texto 'Welcome To Our Blog' tenga el estilo esperado
    final welcomeTextFinder = find.byWidgetPredicate(
      (widget) =>
          widget is TextBase &&
          widget.text == 'Welcome To Our Blog' &&
          widget.fontSize == 14,
    );
    expect(welcomeTextFinder, findsOneWidget);
  });
}
