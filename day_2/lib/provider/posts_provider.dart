import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'package:day_2/services/posts_service.dart';


class PostsProvider extends ChangeNotifier {
  final _service = PostsService();
  bool isLoading = false;
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  Future<void> fetchPosts() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getPosts();
    _posts = response;
    isLoading = false;
    notifyListeners();
  }


}