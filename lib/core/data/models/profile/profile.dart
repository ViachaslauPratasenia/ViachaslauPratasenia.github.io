import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Profile({
    @Default('') String name,
    @Default('') String surname,
    @Default('') String email,
    @Default('') String resumeUrl,
    @Default('') String photo,
    @Default('') String preview,
    @Default('') String shortDescription,
    @Default('') String fullDescription,
    @Default('') String contactMeText,
    @Default([]) List<SocialLink> socialLinks,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class SocialLink with _$SocialLink {
  const factory SocialLink({
    @Default('') String type,
    @Default('') String url,
  }) = _SocialLink;

  factory SocialLink.fromJson(Map<String, dynamic> json) => _$SocialLinkFromJson(json);
}
