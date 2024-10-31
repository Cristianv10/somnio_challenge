import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/presentation/challenge/view/post_list_widget.dart';
import 'package:somnio/presentation/challenge/view/post_card_widget.dart';

void main() {
  group('PostListWidget', () {
    late List<Post> mockPosts;

    setUp(() {
      // Crea una lista de Post de prueba
      mockPosts = [
        Post(title: 'Post 1', body: 'Body of Post 1', userId: 1, id: 1),
        Post(title: 'Post 2', body: 'Body of Post 2', userId: 2, id: 2),
        Post(title: 'Post 3', body: 'Body of Post 3', userId: 3, id: 3),
      ];
    });

    testWidgets('displays correct number of PostCardWidgets',
        (WidgetTester tester) async {
      // Act: Construir el PostListWidget con mockPosts
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostListWidget(posts: mockPosts),
          ),
        ),
      );

      // Assert: Verifica que el número de PostCardWidget corresponda al número de posts
      expect(find.byType(PostCardWidget), findsNWidgets(mockPosts.length));
    });

    testWidgets('displays PostCardWidget with correct post data',
        (WidgetTester tester) async {
      // Act: Construir el PostListWidget con mockPosts
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostListWidget(posts: mockPosts),
          ),
        ),
      );

      // Assert: Verifica que los títulos y cuerpos de los posts se muestren correctamente
      for (var post in mockPosts) {
        expect(find.text(post.title), findsOneWidget);
        expect(find.text(post.body), findsOneWidget);
      }
    });

    testWidgets('displays nothing when post list is empty',
        (WidgetTester tester) async {
      // Act: Construir el PostListWidget con una lista vacía
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PostListWidget(posts: []),
          ),
        ),
      );

      // Assert: Verifica que no haya PostCardWidget cuando la lista está vacía
      expect(find.byType(PostCardWidget), findsNothing);
    });
  });
}
