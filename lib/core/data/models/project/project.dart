import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Projects with _$Projects {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Projects({
    @Default([]) List<ProjectItem> items,
  }) = _Projects;

  factory Projects.fromJson(Map<String, dynamic> json) => _$ProjectsFromJson(json);
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
