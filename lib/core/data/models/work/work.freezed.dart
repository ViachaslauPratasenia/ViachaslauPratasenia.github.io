// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Work _$WorkFromJson(Map<String, dynamic> json) {
  return _Work.fromJson(json);
}

/// @nodoc
mixin _$Work {
  List<String> get latestTechnologies => throw _privateConstructorUsedError;
  List<WorkItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkCopyWith<Work> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkCopyWith<$Res> {
  factory $WorkCopyWith(Work value, $Res Function(Work) then) =
      _$WorkCopyWithImpl<$Res, Work>;
  @useResult
  $Res call({List<String> latestTechnologies, List<WorkItem> items});
}

/// @nodoc
class _$WorkCopyWithImpl<$Res, $Val extends Work>
    implements $WorkCopyWith<$Res> {
  _$WorkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestTechnologies = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      latestTechnologies: null == latestTechnologies
          ? _value.latestTechnologies
          : latestTechnologies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WorkItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkImplCopyWith<$Res> implements $WorkCopyWith<$Res> {
  factory _$$WorkImplCopyWith(
          _$WorkImpl value, $Res Function(_$WorkImpl) then) =
      __$$WorkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> latestTechnologies, List<WorkItem> items});
}

/// @nodoc
class __$$WorkImplCopyWithImpl<$Res>
    extends _$WorkCopyWithImpl<$Res, _$WorkImpl>
    implements _$$WorkImplCopyWith<$Res> {
  __$$WorkImplCopyWithImpl(_$WorkImpl _value, $Res Function(_$WorkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestTechnologies = null,
    Object? items = null,
  }) {
    return _then(_$WorkImpl(
      latestTechnologies: null == latestTechnologies
          ? _value._latestTechnologies
          : latestTechnologies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WorkItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WorkImpl implements _Work {
  const _$WorkImpl(
      {final List<String> latestTechnologies = const [],
      final List<WorkItem> items = const []})
      : _latestTechnologies = latestTechnologies,
        _items = items;

  factory _$WorkImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkImplFromJson(json);

  final List<String> _latestTechnologies;
  @override
  @JsonKey()
  List<String> get latestTechnologies {
    if (_latestTechnologies is EqualUnmodifiableListView)
      return _latestTechnologies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestTechnologies);
  }

  final List<WorkItem> _items;
  @override
  @JsonKey()
  List<WorkItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Work(latestTechnologies: $latestTechnologies, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkImpl &&
            const DeepCollectionEquality()
                .equals(other._latestTechnologies, _latestTechnologies) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_latestTechnologies),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkImplCopyWith<_$WorkImpl> get copyWith =>
      __$$WorkImplCopyWithImpl<_$WorkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkImplToJson(
      this,
    );
  }
}

abstract class _Work implements Work {
  const factory _Work(
      {final List<String> latestTechnologies,
      final List<WorkItem> items}) = _$WorkImpl;

  factory _Work.fromJson(Map<String, dynamic> json) = _$WorkImpl.fromJson;

  @override
  List<String> get latestTechnologies;
  @override
  List<WorkItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$WorkImplCopyWith<_$WorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkItem _$WorkItemFromJson(Map<String, dynamic> json) {
  return _WorkItem.fromJson(json);
}

/// @nodoc
mixin _$WorkItem {
  String get title => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get companyUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get startPeriod => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get endPeriod => throw _privateConstructorUsedError;
  List<WorkLink> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkItemCopyWith<WorkItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkItemCopyWith<$Res> {
  factory $WorkItemCopyWith(WorkItem value, $Res Function(WorkItem) then) =
      _$WorkItemCopyWithImpl<$Res, WorkItem>;
  @useResult
  $Res call(
      {String title,
      String companyName,
      String companyUrl,
      String description,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      DateTime? startPeriod,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      DateTime? endPeriod,
      List<WorkLink> links});
}

/// @nodoc
class _$WorkItemCopyWithImpl<$Res, $Val extends WorkItem>
    implements $WorkItemCopyWith<$Res> {
  _$WorkItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? companyName = null,
    Object? companyUrl = null,
    Object? description = null,
    Object? startPeriod = freezed,
    Object? endPeriod = freezed,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyUrl: null == companyUrl
          ? _value.companyUrl
          : companyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startPeriod: freezed == startPeriod
          ? _value.startPeriod
          : startPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPeriod: freezed == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<WorkLink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkItemImplCopyWith<$Res>
    implements $WorkItemCopyWith<$Res> {
  factory _$$WorkItemImplCopyWith(
          _$WorkItemImpl value, $Res Function(_$WorkItemImpl) then) =
      __$$WorkItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String companyName,
      String companyUrl,
      String description,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      DateTime? startPeriod,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      DateTime? endPeriod,
      List<WorkLink> links});
}

/// @nodoc
class __$$WorkItemImplCopyWithImpl<$Res>
    extends _$WorkItemCopyWithImpl<$Res, _$WorkItemImpl>
    implements _$$WorkItemImplCopyWith<$Res> {
  __$$WorkItemImplCopyWithImpl(
      _$WorkItemImpl _value, $Res Function(_$WorkItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? companyName = null,
    Object? companyUrl = null,
    Object? description = null,
    Object? startPeriod = freezed,
    Object? endPeriod = freezed,
    Object? links = null,
  }) {
    return _then(_$WorkItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyUrl: null == companyUrl
          ? _value.companyUrl
          : companyUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startPeriod: freezed == startPeriod
          ? _value.startPeriod
          : startPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPeriod: freezed == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<WorkLink>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WorkItemImpl implements _WorkItem {
  const _$WorkItemImpl(
      {this.title = '',
      this.companyName = '',
      this.companyUrl = '',
      this.description = '',
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) this.startPeriod,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp) this.endPeriod,
      final List<WorkLink> links = const []})
      : _links = links;

  factory _$WorkItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkItemImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String companyName;
  @override
  @JsonKey()
  final String companyUrl;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  final DateTime? startPeriod;
  @override
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  final DateTime? endPeriod;
  final List<WorkLink> _links;
  @override
  @JsonKey()
  List<WorkLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'WorkItem(title: $title, companyName: $companyName, companyUrl: $companyUrl, description: $description, startPeriod: $startPeriod, endPeriod: $endPeriod, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyUrl, companyUrl) ||
                other.companyUrl == companyUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startPeriod, startPeriod) ||
                other.startPeriod == startPeriod) &&
            (identical(other.endPeriod, endPeriod) ||
                other.endPeriod == endPeriod) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      companyName,
      companyUrl,
      description,
      startPeriod,
      endPeriod,
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkItemImplCopyWith<_$WorkItemImpl> get copyWith =>
      __$$WorkItemImplCopyWithImpl<_$WorkItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkItemImplToJson(
      this,
    );
  }
}

abstract class _WorkItem implements WorkItem {
  const factory _WorkItem(
      {final String title,
      final String companyName,
      final String companyUrl,
      final String description,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      final DateTime? startPeriod,
      @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
      final DateTime? endPeriod,
      final List<WorkLink> links}) = _$WorkItemImpl;

  factory _WorkItem.fromJson(Map<String, dynamic> json) =
      _$WorkItemImpl.fromJson;

  @override
  String get title;
  @override
  String get companyName;
  @override
  String get companyUrl;
  @override
  String get description;
  @override
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get startPeriod;
  @override
  @JsonKey(fromJson: DateTimeUtils.dateTimeFromTimestamp)
  DateTime? get endPeriod;
  @override
  List<WorkLink> get links;
  @override
  @JsonKey(ignore: true)
  _$$WorkItemImplCopyWith<_$WorkItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkLink _$WorkLinkFromJson(Map<String, dynamic> json) {
  return _WorkLink.fromJson(json);
}

/// @nodoc
mixin _$WorkLink {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkLinkCopyWith<WorkLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkLinkCopyWith<$Res> {
  factory $WorkLinkCopyWith(WorkLink value, $Res Function(WorkLink) then) =
      _$WorkLinkCopyWithImpl<$Res, WorkLink>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$WorkLinkCopyWithImpl<$Res, $Val extends WorkLink>
    implements $WorkLinkCopyWith<$Res> {
  _$WorkLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkLinkImplCopyWith<$Res>
    implements $WorkLinkCopyWith<$Res> {
  factory _$$WorkLinkImplCopyWith(
          _$WorkLinkImpl value, $Res Function(_$WorkLinkImpl) then) =
      __$$WorkLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$WorkLinkImplCopyWithImpl<$Res>
    extends _$WorkLinkCopyWithImpl<$Res, _$WorkLinkImpl>
    implements _$$WorkLinkImplCopyWith<$Res> {
  __$$WorkLinkImplCopyWithImpl(
      _$WorkLinkImpl _value, $Res Function(_$WorkLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$WorkLinkImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkLinkImpl implements _WorkLink {
  const _$WorkLinkImpl({this.name = '', this.url = ''});

  factory _$WorkLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkLinkImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'WorkLink(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkLinkImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkLinkImplCopyWith<_$WorkLinkImpl> get copyWith =>
      __$$WorkLinkImplCopyWithImpl<_$WorkLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkLinkImplToJson(
      this,
    );
  }
}

abstract class _WorkLink implements WorkLink {
  const factory _WorkLink({final String name, final String url}) =
      _$WorkLinkImpl;

  factory _WorkLink.fromJson(Map<String, dynamic> json) =
      _$WorkLinkImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$WorkLinkImplCopyWith<_$WorkLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
