// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectsImpl _$$ProjectsImplFromJson(Map<String, dynamic> json) =>
    _$ProjectsImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProjectsImplToJson(_$ProjectsImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$ProjectItemImpl _$$ProjectItemImplFromJson(Map<String, dynamic> json) =>
    _$ProjectItemImpl(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      linkName: json['link_name'] as String? ?? '',
      linkUrl: json['link_url'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$ProjectItemImplToJson(_$ProjectItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'link_name': instance.linkName,
      'link_url': instance.linkUrl,
      'tags': instance.tags,
    };
