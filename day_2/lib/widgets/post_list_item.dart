import 'package:flutter/material.dart';
import 'package:day_2/models/post_model.dart';

class PostListItem extends StatelessWidget {
  final PostModel post;

  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(post.id.toString())),
      subtitle: Text(post.title),
    );
  }
}
