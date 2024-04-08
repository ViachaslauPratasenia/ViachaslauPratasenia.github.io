// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkImpl _$$WorkImplFromJson(Map<String, dynamic> json) => _$WorkImpl(
      latestTechnologies: (json['latest_technologies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => WorkItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkImplToJson(_$WorkImpl instance) =>
    <String, dynamic>{
      'latest_technologies': instance.latestTechnologies,
      'items': instance.items,
    };

_$WorkItemImpl _$$WorkItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkItemImpl(
      title: json['title'] as String? ?? '',
      companyName: json['company_name'] as String? ?? '',
      companyUrl: json['company_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startPeriod: DateTimeUtils.dateTimeFromTimestamp(
          json['start_period'] as Timestamp?),
      endPeriod: DateTimeUtils.dateTimeFromTimestampNullable(
          json['end_period'] as Timestamp?),
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => WorkLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkItemImplToJson(_$WorkItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'company_name': instance.companyName,
      'company_url': instance.companyUrl,
      'description': instance.description,
      'start_period': instance.startPeriod?.toIso8601String(),
      'end_period': instance.endPeriod?.toIso8601String(),
      'links': instance.links,
    };

_$WorkLinkImpl _$$WorkLinkImplFromJson(Map<String, dynamic> json) =>
    _$WorkLinkImpl(
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$WorkLinkImplToJson(_$WorkLinkImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
