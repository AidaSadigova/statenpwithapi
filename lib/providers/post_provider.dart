import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statenpwithapi/models/post_model.dart';
import 'package:statenpwithapi/services/post_notifier.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, List<Post>>((ref) => PostNotifier());
