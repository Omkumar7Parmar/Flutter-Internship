import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_2/providers/posts_provider.dart';
import 'package:day_2/widgets/content_display_handler.dart';
import 'package:day_2/widgets/post_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postsProvider = context.watch<PostsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Center(
        child: ContentDisplayHandler(
          isLoading: postsProvider.isLoading,
          isEmpty: postsProvider.posts.isEmpty,
          child: ListView.builder(
            itemCount: postsProvider.posts.length,
            itemBuilder: (context, index) {
              final post = postsProvider.posts[index];
              return PostListItem(post: post);
            },
          ),
        ),
      ),
    );
  }
}
