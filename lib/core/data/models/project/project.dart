import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Project({
    @Default([]) List<ProjectItem> items,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

@freezed
class ProjectItem with _$ProjectItem {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjectItem({
    @Default('') String title,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default('') String linkName,
    @Default('') String linkUrl,
    @Default([]) List<String> tags,
  }) = _ProjectItem;

  factory ProjectItem.fromJson(Map<String, dynamic> json) => _$ProjectItemFromJson(json);
}
