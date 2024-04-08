// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Projects _$ProjectsFromJson(Map<String, dynamic> json) {
  return _Projects.fromJson(json);
}

/// @nodoc
mixin _$Projects {
  List<ProjectItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsCopyWith<Projects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsCopyWith<$Res> {
  factory $ProjectsCopyWith(Projects value, $Res Function(Projects) then) =
      _$ProjectsCopyWithImpl<$Res, Projects>;
  @useResult
  $Res call({List<ProjectItem> items});
}

/// @nodoc
class _$ProjectsCopyWithImpl<$Res, $Val extends Projects>
    implements $ProjectsCopyWith<$Res> {
  _$ProjectsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectsImplCopyWith<$Res>
    implements $ProjectsCopyWith<$Res> {
  factory _$$ProjectsImplCopyWith(
          _$ProjectsImpl value, $Res Function(_$ProjectsImpl) then) =
      __$$ProjectsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProjectItem> items});
}

/// @nodoc
class __$$ProjectsImplCopyWithImpl<$Res>
    extends _$ProjectsCopyWithImpl<$Res, _$ProjectsImpl>
    implements _$$ProjectsImplCopyWith<$Res> {
  __$$ProjectsImplCopyWithImpl(
      _$ProjectsImpl _value, $Res Function(_$ProjectsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$ProjectsImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProjectsImpl implements _Projects {
  const _$ProjectsImpl({final List<ProjectItem> items = const []})
      : _items = items;

  factory _$ProjectsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectsImplFromJson(json);

  final List<ProjectItem> _items;
  @override
  @JsonKey()
  List<ProjectItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Projects(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsImplCopyWith<_$ProjectsImpl> get copyWith =>
      __$$ProjectsImplCopyWithImpl<_$ProjectsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectsImplToJson(
      this,
    );
  }
}

abstract class _Projects implements Projects {
  const factory _Projects({final List<ProjectItem> items}) = _$ProjectsImpl;

  factory _Projects.fromJson(Map<String, dynamic> json) =
      _$ProjectsImpl.fromJson;

  @override
  List<ProjectItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$ProjectsImplCopyWith<_$ProjectsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectItem _$ProjectItemFromJson(Map<String, dynamic> json) {
  return _ProjectItem.fromJson(json);
}

/// @nodoc
mixin _$ProjectItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get linkName => throw _privateConstructorUsedError;
  String get linkUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectItemCopyWith<ProjectItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectItemCopyWith<$Res> {
  factory $ProjectItemCopyWith(
          ProjectItem value, $Res Function(ProjectItem) then) =
      _$ProjectItemCopyWithImpl<$Res, ProjectItem>;
  @useResult
  $Res call(
      {String title,
      String description,
      String imageUrl,
      String linkName,
      String linkUrl,
      List<String> tags});
}

/// @nodoc
class _$ProjectItemCopyWithImpl<$Res, $Val extends ProjectItem>
    implements $ProjectItemCopyWith<$Res> {
  _$ProjectItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? linkName = null,
    Object? linkUrl = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      linkName: null == linkName
          ? _value.linkName
          : linkName // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectItemImplCopyWith<$Res>
    implements $ProjectItemCopyWith<$Res> {
  factory _$$ProjectItemImplCopyWith(
          _$ProjectItemImpl value, $Res Function(_$ProjectItemImpl) then) =
      __$$ProjectItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String imageUrl,
      String linkName,
      String linkUrl,
      List<String> tags});
}

/// @nodoc
class __$$ProjectItemImplCopyWithImpl<$Res>
    extends _$ProjectItemCopyWithImpl<$Res, _$ProjectItemImpl>
    implements _$$ProjectItemImplCopyWith<$Res> {
  __$$ProjectItemImplCopyWithImpl(
      _$ProjectItemImpl _value, $Res Function(_$ProjectItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? linkName = null,
    Object? linkUrl = null,
    Object? tags = null,
  }) {
    return _then(_$ProjectItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      linkName: null == linkName
          ? _value.linkName
          : linkName // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProjectItemImpl implements _ProjectItem {
  const _$ProjectItemImpl(
      {this.title = '',
      this.description = '',
      this.imageUrl = '',
      this.linkName = '',
      this.linkUrl = '',
      final List<String> tags = const []})
      : _tags = tags;

  factory _$ProjectItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectItemImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String linkName;
  @override
  @JsonKey()
  final String linkUrl;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ProjectItem(title: $title, description: $description, imageUrl: $imageUrl, linkName: $linkName, linkUrl: $linkUrl, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.linkName, linkName) ||
                other.linkName == linkName) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imageUrl,
      linkName, linkUrl, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectItemImplCopyWith<_$ProjectItemImpl> get copyWith =>
      __$$ProjectItemImplCopyWithImpl<_$ProjectItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectItemImplToJson(
      this,
    );
  }
}

abstract class _ProjectItem implements ProjectItem {
  const factory _ProjectItem(
      {final String title,
      final String description,
      final String imageUrl,
      final String linkName,
      final String linkUrl,
      final List<String> tags}) = _$ProjectItemImpl;

  factory _ProjectItem.fromJson(Map<String, dynamic> json) =
      _$ProjectItemImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get linkName;
  @override
  String get linkUrl;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$ProjectItemImplCopyWith<_$ProjectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
