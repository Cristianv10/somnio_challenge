import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/presentation/challenge/view/post_card_widget.dart';
import 'package:somnio/presentation/core/widgets/text_base.dart';

void main() {
  group('PostCardWidget', () {
    late Post mockPost;

    setUp(() {
      // Crea un Post de prueba
      mockPost = Post(
        title: 'Test Title',
        body: 'This is a test body for the post.',
        userId: Random().nextInt(100),
        id: Random().nextInt(100),
      );
    });

    testWidgets('displays post title and body', (WidgetTester tester) async {
      // Act: Construir el PostCardWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostCardWidget(post: mockPost),
          ),
        ),
      );

      // Assert: Verifica que el título y el cuerpo del post estén presentes
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('This is a test body for the post.'), findsOneWidget);
    });

    testWidgets('displays Read More section', (WidgetTester tester) async {
      // Act: Construir el PostCardWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostCardWidget(post: mockPost),
          ),
        ),
      );

      // Assert: Verifica que se muestre el texto "Read More"
      expect(find.text('Read More'), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget); // Verifica que haya un ícono
    });

    testWidgets('displays image asset', (WidgetTester tester) async {
      // Act: Construir el PostCardWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostCardWidget(post: mockPost),
          ),
        ),
      );

      // Assert: Verifica que se muestre la imagen del activo
      expect(find.byType(Image), findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is Image &&
              widget.image == const AssetImage('assets/google_io.png')),
          findsOneWidget);
    });
  });
}
