import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenpwithapi/providers/post_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var posts = ref.watch(postProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                ref.read(postProvider.notifier).addPost();
              },
            ),
          ],
        ),
        body: posts.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  var post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.id.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          ref.read(postProvider.notifier).deletePost(post);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
              ),
        bottomNavigationBar: const BottomAppBar(
          child: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.add),
            ),
          ]),
        ),
      ),
    );
  }
}
