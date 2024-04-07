// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogPost _$BlogPostFromJson(Map<String, dynamic> json) {
  return _BlogPost.fromJson(json);
}

/// @nodoc
mixin _$BlogPost {
  List<BlogPostItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogPostCopyWith<BlogPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogPostCopyWith<$Res> {
  factory $BlogPostCopyWith(BlogPost value, $Res Function(BlogPost) then) =
      _$BlogPostCopyWithImpl<$Res, BlogPost>;
  @useResult
  $Res call({List<BlogPostItem> items});
}

/// @nodoc
class _$BlogPostCopyWithImpl<$Res, $Val extends BlogPost>
    implements $BlogPostCopyWith<$Res> {
  _$BlogPostCopyWithImpl(this._value, this._then);

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
              as List<BlogPostItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogPostImplCopyWith<$Res>
    implements $BlogPostCopyWith<$Res> {
  factory _$$BlogPostImplCopyWith(
          _$BlogPostImpl value, $Res Function(_$BlogPostImpl) then) =
      __$$BlogPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogPostItem> items});
}

/// @nodoc
class __$$BlogPostImplCopyWithImpl<$Res>
    extends _$BlogPostCopyWithImpl<$Res, _$BlogPostImpl>
    implements _$$BlogPostImplCopyWith<$Res> {
  __$$BlogPostImplCopyWithImpl(
      _$BlogPostImpl _value, $Res Function(_$BlogPostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$BlogPostImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BlogPostItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BlogPostImpl implements _BlogPost {
  const _$BlogPostImpl({final List<BlogPostItem> items = const []})
      : _items = items;

  factory _$BlogPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogPostImplFromJson(json);

  final List<BlogPostItem> _items;
  @override
  @JsonKey()
  List<BlogPostItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BlogPost(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogPostImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogPostImplCopyWith<_$BlogPostImpl> get copyWith =>
      __$$BlogPostImplCopyWithImpl<_$BlogPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogPostImplToJson(
      this,
    );
  }
}

abstract class _BlogPost implements BlogPost {
  const factory _BlogPost({final List<BlogPostItem> items}) = _$BlogPostImpl;

  factory _BlogPost.fromJson(Map<String, dynamic> json) =
      _$BlogPostImpl.fromJson;

  @override
  List<BlogPostItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$BlogPostImplCopyWith<_$BlogPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlogPostItem _$BlogPostItemFromJson(Map<String, dynamic> json) {
  return _BlogPostItem.fromJson(json);
}

/// @nodoc
mixin _$BlogPostItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get date => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogPostItemCopyWith<BlogPostItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogPostItemCopyWith<$Res> {
  factory $BlogPostItemCopyWith(
          BlogPostItem value, $Res Function(BlogPostItem) then) =
      _$BlogPostItemCopyWithImpl<$Res, BlogPostItem>;
  @useResult
  $Res call(
      {String title,
      String description,
      String url,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? date,
      List<String> tags});
}

/// @nodoc
class _$BlogPostItemCopyWithImpl<$Res, $Val extends BlogPostItem>
    implements $BlogPostItemCopyWith<$Res> {
  _$BlogPostItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? date = freezed,
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogPostItemImplCopyWith<$Res>
    implements $BlogPostItemCopyWith<$Res> {
  factory _$$BlogPostItemImplCopyWith(
          _$BlogPostItemImpl value, $Res Function(_$BlogPostItemImpl) then) =
      __$$BlogPostItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String url,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? date,
      List<String> tags});
}

/// @nodoc
class __$$BlogPostItemImplCopyWithImpl<$Res>
    extends _$BlogPostItemCopyWithImpl<$Res, _$BlogPostItemImpl>
    implements _$$BlogPostItemImplCopyWith<$Res> {
  __$$BlogPostItemImplCopyWithImpl(
      _$BlogPostItemImpl _value, $Res Function(_$BlogPostItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? date = freezed,
    Object? tags = null,
  }) {
    return _then(_$BlogPostItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BlogPostItemImpl implements _BlogPostItem {
  const _$BlogPostItemImpl(
      {this.title = '',
      this.description = '',
      this.url = '',
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) this.date,
      final List<String> tags = const []})
      : _tags = tags;

  factory _$BlogPostItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogPostItemImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  final DateTime? date;
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
    return 'BlogPostItem(title: $title, description: $description, url: $url, date: $date, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogPostItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, url, date,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogPostItemImplCopyWith<_$BlogPostItemImpl> get copyWith =>
      __$$BlogPostItemImplCopyWithImpl<_$BlogPostItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogPostItemImplToJson(
      this,
    );
  }
}

abstract class _BlogPostItem implements BlogPostItem {
  const factory _BlogPostItem(
      {final String title,
      final String description,
      final String url,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      final DateTime? date,
      final List<String> tags}) = _$BlogPostItemImpl;

  factory _BlogPostItem.fromJson(Map<String, dynamic> json) =
      _$BlogPostItemImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get url;
  @override
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get date;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$BlogPostItemImplCopyWith<_$BlogPostItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
