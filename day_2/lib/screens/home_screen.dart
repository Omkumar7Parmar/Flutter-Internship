import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_2/provider/posts_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<PostsProvider>();
    return Scaffold(
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator():
            provider.posts.isEmpty
            ? const Text("No Data Found")
            : ListView.builder(itemCount: provider.posts.length ,itemBuilder: (context, index) {

          final post = context.watch<PostsProvider>().posts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(post.id.toString())),
            subtitle: Text(post.title),
          );
        }),
      ),
    );
  }
}
