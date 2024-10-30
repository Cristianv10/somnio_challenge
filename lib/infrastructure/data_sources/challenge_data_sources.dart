import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:somnio/domain/challenge/entities/post.dart';
import 'package:somnio/domain/core/response_model.dart';
import 'package:somnio/infrastructure/network/challenge_network.dart';

class ChallengeDataSource {
  Future<List<Post>> fetchPostInformation() async {
    try {
      final response = await http.get(Uri.parse(ChallengeNetwork.baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return ResponseModel.fromJsonList(data);
      } else {
        throw Exception(
            'Failed to load posts, status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}
