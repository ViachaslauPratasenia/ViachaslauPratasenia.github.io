// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogPostImpl _$$BlogPostImplFromJson(Map<String, dynamic> json) =>
    _$BlogPostImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => BlogPostItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BlogPostImplToJson(_$BlogPostImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$BlogPostItemImpl _$$BlogPostItemImplFromJson(Map<String, dynamic> json) =>
    _$BlogPostItemImpl(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      url: json['url'] as String? ?? '',
      date: DateTimeUtils.dateTimeFromTimestamp(json['date'] as Timestamp?),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$BlogPostItemImplToJson(_$BlogPostItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'date': instance.date?.toIso8601String(),
      'tags': instance.tags,
    };
