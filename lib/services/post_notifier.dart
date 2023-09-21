import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenpwithapi/models/post_model.dart';
import 'package:dio/dio.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([]) {
    getPosts();
  }

  getPosts() async {
    var res = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    var post = res.data as List;
    var postData = post.map((e) => Post.fromJson(e)).toList();
    state = postData;
  }

  void deletePost(Post index) {
    state = state.where((element) => element.id != index.id).toList();
  }

  void addPost() =>
      state = [Post(userId: 1, id: 200, title: 'war', body: 'war'), ...state];
}
