// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      name: json['name'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      resumeUrl: json['resume_url'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      preview: json['preview'] as String? ?? '',
      shortDescription: json['short_description'] as String? ?? '',
      fullDescription: json['full_description'] as String? ?? '',
      contactMeText: json['contact_me_text'] as String? ?? '',
      socialLinks: (json['social_links'] as List<dynamic>?)
              ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'resume_url': instance.resumeUrl,
      'photo': instance.photo,
      'preview': instance.preview,
      'short_description': instance.shortDescription,
      'full_description': instance.fullDescription,
      'contact_me_text': instance.contactMeText,
      'social_links': instance.socialLinks,
    };

_$SocialLinkImpl _$$SocialLinkImplFromJson(Map<String, dynamic> json) =>
    _$SocialLinkImpl(
      type: json['type'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$SocialLinkImplToJson(_$SocialLinkImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
    };
