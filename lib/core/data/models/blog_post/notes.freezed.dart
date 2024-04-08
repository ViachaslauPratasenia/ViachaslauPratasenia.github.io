// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notes _$NotesFromJson(Map<String, dynamic> json) {
  return _Notes.fromJson(json);
}

/// @nodoc
mixin _$Notes {
  List<NoteItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesCopyWith<Notes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesCopyWith<$Res> {
  factory $NotesCopyWith(Notes value, $Res Function(Notes) then) =
      _$NotesCopyWithImpl<$Res, Notes>;
  @useResult
  $Res call({List<NoteItem> items});
}

/// @nodoc
class _$NotesCopyWithImpl<$Res, $Val extends Notes>
    implements $NotesCopyWith<$Res> {
  _$NotesCopyWithImpl(this._value, this._then);

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
              as List<NoteItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotesImplCopyWith<$Res> implements $NotesCopyWith<$Res> {
  factory _$$NotesImplCopyWith(
          _$NotesImpl value, $Res Function(_$NotesImpl) then) =
      __$$NotesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NoteItem> items});
}

/// @nodoc
class __$$NotesImplCopyWithImpl<$Res>
    extends _$NotesCopyWithImpl<$Res, _$NotesImpl>
    implements _$$NotesImplCopyWith<$Res> {
  __$$NotesImplCopyWithImpl(
      _$NotesImpl _value, $Res Function(_$NotesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$NotesImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NoteItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$NotesImpl implements _Notes {
  const _$NotesImpl({final List<NoteItem> items = const []}) : _items = items;

  factory _$NotesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotesImplFromJson(json);

  final List<NoteItem> _items;
  @override
  @JsonKey()
  List<NoteItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Notes(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotesImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotesImplCopyWith<_$NotesImpl> get copyWith =>
      __$$NotesImplCopyWithImpl<_$NotesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotesImplToJson(
      this,
    );
  }
}

abstract class _Notes implements Notes {
  const factory _Notes({final List<NoteItem> items}) = _$NotesImpl;

  factory _Notes.fromJson(Map<String, dynamic> json) = _$NotesImpl.fromJson;

  @override
  List<NoteItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$NotesImplCopyWith<_$NotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoteItem _$NoteItemFromJson(Map<String, dynamic> json) {
  return _NoteItem.fromJson(json);
}

/// @nodoc
mixin _$NoteItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get date => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteItemCopyWith<NoteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteItemCopyWith<$Res> {
  factory $NoteItemCopyWith(NoteItem value, $Res Function(NoteItem) then) =
      _$NoteItemCopyWithImpl<$Res, NoteItem>;
  @useResult
  $Res call(
      {String title,
      String description,
      String url,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) DateTime? date,
      List<String> tags});
}

/// @nodoc
class _$NoteItemCopyWithImpl<$Res, $Val extends NoteItem>
    implements $NoteItemCopyWith<$Res> {
  _$NoteItemCopyWithImpl(this._value, this._then);

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
abstract class _$$NoteItemImplCopyWith<$Res>
    implements $NoteItemCopyWith<$Res> {
  factory _$$NoteItemImplCopyWith(
          _$NoteItemImpl value, $Res Function(_$NoteItemImpl) then) =
      __$$NoteItemImplCopyWithImpl<$Res>;
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
class __$$NoteItemImplCopyWithImpl<$Res>
    extends _$NoteItemCopyWithImpl<$Res, _$NoteItemImpl>
    implements _$$NoteItemImplCopyWith<$Res> {
  __$$NoteItemImplCopyWithImpl(
      _$NoteItemImpl _value, $Res Function(_$NoteItemImpl) _then)
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
    return _then(_$NoteItemImpl(
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
class _$NoteItemImpl implements _NoteItem {
  const _$NoteItemImpl(
      {this.title = '',
      this.description = '',
      this.url = '',
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) this.date,
      final List<String> tags = const []})
      : _tags = tags;

  factory _$NoteItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteItemImplFromJson(json);

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
    return 'NoteItem(title: $title, description: $description, url: $url, date: $date, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteItemImpl &&
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
  _$$NoteItemImplCopyWith<_$NoteItemImpl> get copyWith =>
      __$$NoteItemImplCopyWithImpl<_$NoteItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteItemImplToJson(
      this,
    );
  }
}

abstract class _NoteItem implements NoteItem {
  const factory _NoteItem(
      {final String title,
      final String description,
      final String url,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      final DateTime? date,
      final List<String> tags}) = _$NoteItemImpl;

  factory _NoteItem.fromJson(Map<String, dynamic> json) =
      _$NoteItemImpl.fromJson;

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
  _$$NoteItemImplCopyWith<_$NoteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
