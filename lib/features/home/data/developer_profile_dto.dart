class DeveloperProfileDto {
  final String? name;
  final String? jobTitle;
  final String? shortDescription;
  final String? fullDescription;
  final bool? showLanguages;
  final List<SocialLinkDto>? socialLinks;
  final List<LanguageDto>? languages;
  final List<WorkExperienceDto>? work;
  final List<ProjectDto>? projects;
  final List<BlogPostDto>? blogPosts;

  DeveloperProfileDto({
    this.name,
    this.jobTitle,
    this.shortDescription,
    this.fullDescription,
    this.socialLinks,
    this.showLanguages,
    this.languages,
    this.work,
    this.projects,
    this.blogPosts,
  });

  factory DeveloperProfileDto.fromJson(Map<String, dynamic> json) {
    return DeveloperProfileDto(
      name: json['name'] as String?,
      jobTitle: json['job_title'] as String?,
      shortDescription: json['short_description'] as String?,
      fullDescription: json['full_description'] as String?,
      socialLinks: (json['social_links'] as List?)
          ?.map((e) => SocialLinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      showLanguages: json['show_languages'] as bool?,
      languages: (json['languages'] as List?)
          ?.map((e) => LanguageDto.fromJson(e as Map<String, dynamic>))
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

class LanguageDto {
  final String? name;
  final String? level;

  LanguageDto({this.name, this.level});

  factory LanguageDto.fromJson(Map<String, dynamic> json) {
    return LanguageDto(
      name: json['name'] as String?,
      level: json['level'] as String?,
    );
  }
}

class WorkExperienceDto {
  final String? title;
  final String? companyLink;
  final String? description;
  final String? from;
  final String? to;
  final List<WorkLinkDto>? links;
  final List<String>? skills;

  WorkExperienceDto({
    this.title,
    this.companyLink,
    this.description,
    this.from,
    this.to,
    this.links,
    this.skills,
  });

  factory WorkExperienceDto.fromJson(Map<String, dynamic> json) {
    return WorkExperienceDto(
      title: json['title'] as String?,
      companyLink: json['company_link'] as String?,
      description: json['description'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      links: (json['links'] as List?)
          ?.map((e) => WorkLinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List?)?.map((e) => e as String).toList(),
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
  final String? link;
  final String? description;
  final List<String>? tags;

  ProjectDto({
    this.title,
    this.image,
    this.link,
    this.description,
    this.tags,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) {
    return ProjectDto(
      title: json['title'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
    );
  }
}

class BlogPostDto {
  final String? title;
  final String? image;
  final String? link;
  final String? description;
  final List<String>? tags;
  final String? date;

  BlogPostDto({
    this.title,
    this.image,
    this.link,
    this.description,
    this.tags,
    this.date,
  });

  factory BlogPostDto.fromJson(Map<String, dynamic> json) {
    return BlogPostDto(
      title: json['title'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
      date: json['date'] as String?,
    );
  }
}
