// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_website/core/utils/date_time_utils.dart';

part 'blog_post.freezed.dart';

part 'blog_post.g.dart';

@freezed
class BlogPost with _$BlogPost {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BlogPost({
    @Default([]) List<BlogPostItem> items,
  }) = _BlogPost;

  factory BlogPost.fromJson(Map<String, dynamic> json) => _$BlogPostFromJson(json);
}

@freezed
class BlogPostItem with _$BlogPostItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BlogPostItem({
    @Default('') String title,
    @Default('') String description,
    @Default('') String url,
    @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? date,
    @Default([]) List<String> tags,
  }) = _BlogPostItem;

  factory BlogPostItem.fromJson(Map<String, dynamic> json) => _$BlogPostItemFromJson(json);
}
