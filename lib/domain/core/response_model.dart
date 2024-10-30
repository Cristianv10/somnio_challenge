// domain/response_models/post_response_model.dart
import 'package:somnio/domain/challenge/entities/post.dart';

class ResponseModel {
  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  static List<Post> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }
}
