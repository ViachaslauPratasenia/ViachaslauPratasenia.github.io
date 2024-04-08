// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_website/core/utils/date_time_utils.dart';

part 'notes.freezed.dart';

part 'notes.g.dart';

@freezed
class Notes with _$Notes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Notes({
    @Default([]) List<NoteItem> items,
  }) = _Notes;

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
}

@freezed
class NoteItem with _$NoteItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NoteItem({
    @Default('') String title,
    @Default('') String description,
    @Default('') String url,
    @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? date,
    @Default([]) List<String> tags,
  }) = _NoteItem;

  factory NoteItem.fromJson(Map<String, dynamic> json) => _$NoteItemFromJson(json);
}
