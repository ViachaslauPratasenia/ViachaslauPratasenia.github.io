class DeveloperProfileDto {
  final String? name;
  final String? email;
  final String? subtitle;
  final TitleTextDto? aboutMe;
  final TitleTextDto? contactMe;
  final List<String> recentTechnologies;
  final String? heroRole;
  final List<HeroMetaDto>? heroMeta;
  final SkillsDto? skills;
  final List<SocialLinkDto>? socialLinks;
  final List<WorkExperienceDto>? work;
  final List<ProjectDto>? projects;
  final List<BlogPostDto>? blogPosts;

  DeveloperProfileDto({
    this.name,
    this.email,
    this.subtitle,
    this.aboutMe,
    this.contactMe,
    this.recentTechnologies = const [],
    this.heroRole,
    this.heroMeta,
    this.skills,
    this.socialLinks,
    this.work,
    this.projects,
    this.blogPosts,
  });

  factory DeveloperProfileDto.fromJson(Map<String, dynamic> json) {
    return DeveloperProfileDto(
      name: json['name'] as String?,
      email: json['email'] as String?,
      subtitle: json['subtitle'] as String?,
      aboutMe: json['about_me'] is Map<String, dynamic>
          ? TitleTextDto.fromJson(json['about_me'] as Map<String, dynamic>)
          : null,
      contactMe: json['contact_me'] is Map<String, dynamic>
          ? TitleTextDto.fromJson(json['contact_me'] as Map<String, dynamic>)
          : null,
      recentTechnologies:
          (json['recent_technologies'] as List?)?.map((e) => e as String).toList() ?? [],
      heroRole: json['hero_role'] as String?,
      heroMeta: (json['hero_meta'] as List?)
          ?.map((e) => HeroMetaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: json['skills'] == null
          ? null
          : SkillsDto.fromJson(json['skills'] as Map<String, dynamic>),
      socialLinks: (json['social_links'] as List?)
          ?.map((e) => SocialLinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      work: (json['work'] as List?)
          ?.map((e) => WorkExperienceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List?)
          ?.map((e) => ProjectDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogPosts: (json['blog_posts'] as List?)
          ?.map((e) => BlogPostDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TitleTextDto {
  final String? title;
  final String? text;
  TitleTextDto({this.title, this.text});
  factory TitleTextDto.fromJson(Map<String, dynamic> json) =>
      TitleTextDto(title: json['title'] as String?, text: json['text'] as String?);
}

class HeroMetaDto {
  final String? value;
  final String? label;
  HeroMetaDto({this.value, this.label});
  factory HeroMetaDto.fromJson(Map<String, dynamic> json) =>
      HeroMetaDto(value: json['value'] as String?, label: json['label'] as String?);
}

class SkillsDto {
  final List<String> recently;
  final List<String> platforms;
  final List<String> tooling;
  final List<String> services;
  SkillsDto({
    this.recently = const [],
    this.platforms = const [],
    this.tooling = const [],
    this.services = const [],
  });
  factory SkillsDto.fromJson(Map<String, dynamic> json) => SkillsDto(
        recently: (json['recently'] as List?)?.map((e) => e as String).toList() ?? const [],
        platforms: (json['platforms'] as List?)?.map((e) => e as String).toList() ?? const [],
        tooling: (json['tooling'] as List?)?.map((e) => e as String).toList() ?? const [],
        services: (json['services'] as List?)?.map((e) => e as String).toList() ?? const [],
      );
}

class SocialLinkDto {
  final String? name;
  final String? url;

  SocialLinkDto({this.name, this.url});

  factory SocialLinkDto.fromJson(Map<String, dynamic> json) {
    return SocialLinkDto(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }
}

class WorkExperienceDto {
  final String? title;
  final String? companyName;
  final String? companyLink;
  final String? description;
  final String? workPeriod;
  final List<WorkLinkDto>? links;

  WorkExperienceDto({
    this.title,
    this.companyName,
    this.companyLink,
    this.description,
    this.workPeriod,
    this.links,
  });

  factory WorkExperienceDto.fromJson(Map<String, dynamic> json) {
    return WorkExperienceDto(
      title: json['title'] as String?,
      companyName: json['company_name'] as String?,
      companyLink: json['company_link'] as String?,
      description: json['description'] as String?,
      workPeriod: json['work_period'] as String?,
      links: (json['links'] as List?)
          ?.map((e) => WorkLinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class WorkLinkDto {
  final String? name;
  final String? url;

  WorkLinkDto({this.name, this.url});

  factory WorkLinkDto.fromJson(Map<String, dynamic> json) {
    return WorkLinkDto(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }
}

class ProjectDto {
  final String? title;
  final String? image;
  final String? linkName;
  final String? link;
  final String? description;
  final List<String>? tags;

  ProjectDto({
    this.title,
    this.image,
    this.linkName,
    this.link,
    this.description,
    this.tags,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) {
    return ProjectDto(
      title: json['title'] as String?,
      image: json['image'] as String?,
      linkName: json['link_name'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
    );
  }
}

class BlogPostDto {
  final String? title;
  final String? link;
  final String? description;
  final List<String>? tags;
  final String? date;

  BlogPostDto({
    this.title,
    this.link,
    this.description,
    this.tags,
    this.date,
  });

  factory BlogPostDto.fromJson(Map<String, dynamic> json) {
    return BlogPostDto(
      title: json['title'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
      date: json['date'] as String?,
    );
  }
}
