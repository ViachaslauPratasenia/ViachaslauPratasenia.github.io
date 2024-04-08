// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotesImpl _$$NotesImplFromJson(Map<String, dynamic> json) => _$NotesImpl(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => NoteItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NotesImplToJson(_$NotesImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$NoteItemImpl _$$NoteItemImplFromJson(Map<String, dynamic> json) =>
    _$NoteItemImpl(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      url: json['url'] as String? ?? '',
      date: DateTimeUtils.dateTimeFromTimestamp(json['date'] as Timestamp?),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$NoteItemImplToJson(_$NoteItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'date': instance.date?.toIso8601String(),
      'tags': instance.tags,
    };
