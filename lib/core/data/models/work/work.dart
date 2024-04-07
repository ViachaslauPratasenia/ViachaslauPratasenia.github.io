// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_website/core/utils/date_time_utils.dart';

part 'work.freezed.dart';

part 'work.g.dart';

@freezed
class Work with _$Work {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Work({
    @Default([]) List<String> latestTechnologies,
    @Default([]) List<WorkItem> items,
  }) = _Work;

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);
}

@freezed
class WorkItem with _$WorkItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkItem({
    @Default('') String title,
    @Default('') String companyName,
    @Default('') String companyUrl,
    @Default('') String description,
    @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? startPeriod,
    @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? endPeriod,
    @Default([]) List<WorkLink> links,
  }) = _WorkItem;

  factory WorkItem.fromJson(Map<String, dynamic> json) => _$WorkItemFromJson(json);
}

@freezed
class WorkLink with _$WorkLink {
  const factory WorkLink({
    @Default('') String name,
    @Default('') String url,
  }) = _WorkLink;

  factory WorkLink.fromJson(Map<String, dynamic> json) => _$WorkLinkFromJson(json);
}
