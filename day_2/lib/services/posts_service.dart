import 'package:http/http.dart';
import 'dart:convert';
import '../models/post_model.dart';
class PostsService {
  Future<List<PostModel>> getPosts() async {
    const url = "https://flutter.free.beeceptor.com/posts";
    final uri = Uri.parse(url);
    final response = await get(uri);
    try{
      if(response.statusCode == 200){
        final json = jsonDecode(response.body) as List;
        final posts = json.map((e){
          return PostModel(
            userId: e['userId'],
            id: e['id'],
            title: e['title'],
            body: e['body'],
          );
        }).toList();
        return posts;
      }
      else{
        throw Exception("Server Error");
      }
    }
    catch (e){
      throw Exception("Server Error");
    }
  }
}